FROM fedora:39

WORKDIR /home/user/project

RUN dnf install -y python3.9 python3.10 curl

RUN curl --proto '=https' --tlsv1.2 -fsSL https://static.pantsbuild.org/setup/get-pants.sh | bash

COPY ./ .