#!/usr/bin/env bash
mkdir -p ~/.linuxbrew/{,s}bin
export PATH=~/.linuxbrew/bin:~/.linuxbrew/sbin:$PATH
set -e 
unset LD_LIBRARY_PATH PKG_CONFIG_PATH
#apt-get install build-essential curl git m4 ruby texinfo libbz2-dev libcurl4-openssl-dev libexpat-dev libncurses-dev zlib1g-dev
yes | /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew update
brew doctor
brew update
brew install gcc --with-glibc
if [ ! "$?" = "0" ]; then
    hash gcc || (echo Missing gcc, exiting; exit 1)
    ln -s $(which gcc) `brew --prefix`/bin/gcc-$(gcc -dumpversion |cut -d. -f1,2)
    ln -s $(which g++) `brew --prefix`/bin/g++-$(g++ -dumpversion |cut -d. -f1,2)
fi
brew tap homebrew/dupes
brew install perl git
brew install coreutils findutils gawk gnu-sed gnu-which grep make ruby
brew install zsh git-extras
brew install hello && brew test hello; brew remove hello
