FROM codenvy/ubuntu_jdk8_x11

USER root

RUN apt-get update -y \
    && apt-get install -y zsh \
	&& rm -rf /var/lib/apt/lists/* \
	&& chsh -s /usr/bin/zsh

ENV SHELL /usr/bin/zsh

WORKDIR /root
