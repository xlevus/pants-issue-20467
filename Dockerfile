FROM fedora:37

WORKDIR /home/user/project

RUN dnf install -y python3.9 python3.10 curl wget libxcrypt-compat

RUN curl --proto '=https' --tlsv1.2 -fsSL https://static.pantsbuild.org/setup/get-pants.sh | bash

COPY . ./
