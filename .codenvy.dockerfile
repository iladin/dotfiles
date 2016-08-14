FROM codenvy/ubuntu_jdk8_x11
MAINTAINER iladin

USER root

RUN apt-get update -y \
    && apt-get install -y vim zsh ssh git curl \
    sudo python-pip automake make binutils bison gcc build-essential \
    && pip install powerline-status \
    && chsh -s /usr/bin/zsh \
    && cd /etc/skel/ && git init . \
    && git remote add -t \* -f origin https://gitlab.com/iladin/dotfiles.git \
    && git pull origin master \
    && useradd -m iladin \
    && echo "iladin ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers \
    && chsh -s /bin/zsh iladin \
    && chown -R iladin:iladin /home/iladin \

    && rm -rf /var/lib/apt/lists/*

USER iladin



