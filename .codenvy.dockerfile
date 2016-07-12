FROM codenvy/ubuntu_jdk8_x11

USER root

RUN add-apt-repository ppa:neovim-ppa/unstable \
    && apt-get update -y \
    && apt-get install -y neovim zsh httpie ssh git ruby htop curl \
    sudo python-pip  mercurial make binutils bison gcc build-essential
	&& rm -rf /var/lib/apt/lists/* \
	&& chsh -s /usr/bin/zsh
    && rm /bin/sh && ln -s /bin/zsh /bin/sh

ENV SHELL /usr/bin/zsh

RUN useradd -m iladin
echo "iladin ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers && \
 chsh -s /bin/zsh iladin

RUN chown -R iladin:iladin /home/iladin
USER iladin

RUN git clone https://github.com/iladin/dotfiles.git

WORKDIR /home/iladin
