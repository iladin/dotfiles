FROM codenvy/ubuntu_jdk8_x11
MAINTAINER iladin

USER root

RUN apt-get update -y \
    && apt-get install -yyq emacs vim zsh ssh git curl python-pip automake make binutils bison gcc build-essential \
    && git clone --bare . /etc/skel/.cfg
    && git --git-dir=/etc/skel/.cfg --work-tree=/etc/skel checkout --force \
    && useradd -m Developer \
    && echo "Developer ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers \
    && chsh -s /bin/zsh Developer \
    && chown -R Developer:Developer /home/Developer \
    && rm -rf /var/lib/apt/lists/*



