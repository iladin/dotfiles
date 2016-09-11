FROM codenvy/ubuntu_jdk8_x11
MAINTAINER iladin

USER root

RUN apt-get update -y \
    && apt-get install -yyq emacs vim zsh ssh git curl python-pip automake make binutils bison gcc build-essential \
    && chsh -s /usr/bin/zsh \
    && git clone --bare https://gitlab.com/iladin/dotfiles.git $HOME/.cfg && git --git-dir=$HOME/.cfg/ --work-tree=$HOME checkout --force \
    && rm -rf /var/lib/apt/lists/*



