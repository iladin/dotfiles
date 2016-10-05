FROM codenvy/ubuntu_jdk8_x11
MAINTAINER iladin

USER root

RUN apt-get update -y \
    && ls -al \
    && printenv \
    && apt-get install -yyq emacs vim zsh ssh git curl python-pip automake make binutils bison gcc build-essential \
    && set -xv \
    && make deploy
    && rm -rf /var/lib/apt/lists/*



