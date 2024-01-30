#!/bin/bash

set -e

PBS_VERSIONS="20240107 20231002 20230826"

declare -A VERMAP
VERMAP["20240107"]="3.9.18 3.10.13 3.11.7 3.12.1"
VERMAP["20231002"]="3.9.18 3.10.13 3.11.6 3.12.0"
VERMAP["20230826"]="3.9.18 3.10.13 3.11.5"

for PBS in $PBS_VERSIONS; do
    PY_VERSIONS="${VERMAP[$PBS]}"

    for PYVER in $PY_VERSIONS; do
        URL="https://github.com/indygreg/python-build-standalone/releases/download/${PBS}/cpython-${PYVER}+${PBS}-x86_64-unknown-linux-gnu-install_only.tar.gz"
        TAR="python_${PBS}_${PYVER}.tar.gz"

        if [[ ! -f "${TAR}" ]]; then
            wget ${URL} -O ${TAR}
        fi
        tar xf ${TAR}

        echo "------------------------------------------"
        echo "      ${PBS} / ${PYVER}"
        echo "------------------------------------------"
        echo ">>> ${PYVER} (no fix)"
        ./python/bin/python3 repro.py

        echo ">>> ${PYVER} (fix)"
        ./python/bin/python3 repro.py import-first
        echo "------------------------------------------"
        
        rm -rf python
    done
done