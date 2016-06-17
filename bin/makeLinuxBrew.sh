#!/usr/bin/env bash
source ~/.functions.sh
mkdir -p ~/.linuxbrew/{,s}bin
pathadd ~/.linuxbrew/bin
pathadd ~/.linuxbrew/sbin

#TODO: give pathadd a for loop

unset LD_LIBRARY_PATH PKG_CONFIG_PATH
#apt-get install build-essential curl git m4 ruby texinfo libbz2-dev libcurl4-openssl-dev libexpat-dev libncurses-dev zlib1g-dev
yes | ruby -e "$(curl -fsSL https://raw.github.com/Linuxbrew/linuxbrew/go/install)"
brew update
brew doctor
brew update
brew install gcc --with-glibc
brew tap homebrew/dupes
brew install perl git
brew install coreutils findutils gawk gnu-sed gnu-which grep make ruby
brew install zsh git-extras

brew install hello && brew test hello; brew remove hello
