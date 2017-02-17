FROM codenvy/ubuntu_jdk8_x11
MAINTAINER iladin

USER root

RUN apt-get update -y \
    && printenv \
    && find \
    && apt-get install -yyq emacs rsync vim zsh ssh git curl python-pip automake make binutils bison gcc build-essential \
    && rm -rf /var/lib/apt/lists/*

