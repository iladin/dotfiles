FROM codenvy/ubuntu_jdk8_x11
MAINTAINER iladin

USER root

RUN apt-get update -y \
    && ls -al \
    && printenv \
    && apt-get install -yyq emacs  zsh ssh git curl rsync automake make binutils bison gcc build-essential \
    && set -xv \
    && rsync -avz . $HOME/
    && rm -rf /var/lib/apt/lists/*



