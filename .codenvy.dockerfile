FROM codenvy/ubuntu_jdk8_x11
MAINTAINER iladin

USER root

RUN add-apt-repository ppa:neovim-ppa/unstable \
    && apt-get update -y \
    && apt-get install -y neovim  zsh   ssh git   curl \
    sudo python-pip automake  make binutils bison gcc build-essential \
    && chsh -s /usr/bin/zsh \
    && rm /bin/sh \
    && ln -s /bin/zsh /bin/sh \
    && useradd -m iladin \
    && echo "iladin ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers \
    && chsh -s /bin/zsh iladin \
    && chown -R iladin:iladin /home/iladin \
    && pip install  powerline-status \
    && rm -rf /var/lib/apt/lists/*

USER iladin
COPY . /home/iladin/


EXPOSE 22

WORKDIR /home/iladin


