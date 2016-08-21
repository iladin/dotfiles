FROM codenvy/ubuntu_jdk8_x11
MAINTAINER iladin

USER root

RUN apt-get update -y \
    && apt-get install -yyq emacs vim zsh ssh git curl \
    sudo python-pip automake make binutils bison gcc build-essential \
    && chsh -s /usr/bin/zsh \
    && cd /etc/skel/ && git clone --bare https://gitlab.com/iladin/dotfiles.git  /etc/skel/.cfg && git --git-dir=.cfg/ --work-tree=$PWD checkout --force \
    && useradd -m iladin \
    && echo "iladin ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers \
    && chsh -s /bin/zsh iladin \
    && chown -R iladin:iladin /home/iladin \

    && rm -rf /var/lib/apt/lists/*

USER iladin



