FROM codenvy/ubuntu_jdk8_x11

USER root

RUN add-apt-repository ppa:neovim-ppa/unstable \
    && apt-get update -y \
    && apt-get install -y neovim zsh httpie tmux ssh git ruby htop curl \
    sudo python-pip  mercurial make binutils bison gcc build-essential \
    && rm -rf /var/lib/apt/lists/* \
    && chsh -s /usr/bin/zsh \
    && rm /bin/sh \
    && ln -s /bin/zsh /bin/sh \
    && useradd -m iladin \
    && echo "iladin ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers \
    && chsh -s /bin/zsh iladin \
    && chown -R iladin:iladin /home/iladin \
    && pip install  powerline-status
    && git clone https://github.com/iladin/dotfiles.git

USER iladin


RUN git clone https://github.com/iladin/dotfiles.git

WORKDIR /home/iladin
