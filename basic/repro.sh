#!/bin/bash

PY_VERSIONS="3.9.18 3.10.13 3.11.7 3.12.1"

for PYVER in $PY_VERSIONS; do
    URL="https://github.com/indygreg/python-build-standalone/releases/download/20240107/cpython-${PYVER}+20240107-x86_64-unknown-linux-gnu-install_only.tar.gz"
    TAR="python_${PYVER}.tar.gz"

    if [[ -f $TAR ]]; then
        wget -q ${URL} -O ${TAR}
    fi

    tar xf ${TAR}

    echo ">>> ${PYVER} (no fix)"
    ./python/bin/python3 repro.py

    echo ">>> ${PYVER} (fix)"
    ./python/bin/python3 repro.py import-first

    echo "------------------------------------------"
done