FROM codenvy/ubuntu_jdk8_x11
MAINTAINER iladin

USER root

RUN apt-get update -y \
    && ls -al
    && apt-get install -yyq emacs vim zsh ssh git curl python-pip automake make binutils bison gcc build-essential \
    && set -xv
    && git --git-dir=/etc/skel/.cfg --work-tree=/etc/skel clone http://gitlab.com/iladin/dotfiles \
    && useradd -m Developer --shell /bin/zsh \
    && echo "Developer ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers \
    && chown -R Developer:Developer /home/Developer \
    && rm -rf /var/lib/apt/lists/*



