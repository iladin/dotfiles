#!/usr/bin/env bash
# TODO: test if pathadd is defined
mkdir -p ~/.linuxbrew/{,s}bin
pathadd ~/.linuxbrew/bin
pathadd ~/.linuxbrew/sbin

#TODO: give pathadd a for loop

unset LD_LIBRARY_PATH PKG_CONFIG_PATH
yes | ruby -e "$(curl -fsSL https://raw.github.com/Linuxbrew/linuxbrew/go/install)"
brew doctor

brew install gcc --with-glibc
brew tap homebrew/dupes
brew install git
brew install coreutils findutils gawk gnu-sed gnu-which grep make ruby

brew install hello && brew test hello; brew remove hello
