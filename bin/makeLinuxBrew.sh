PATH=~/.linuxbrew/bin:/usr/local/bin:/usr/bin:/bin
unset LD_LIBRARY_PATH PKG_CONFIG_PATH
yes | ruby -e "$(curl -fsSL https://raw.github.com/Linuxbrew/linuxbrew/go/install)"
brew doctor

brew install gcc --with-glibc
brew tap homebrew/dupes
brew install git
brew install coreutils findutils gawk gnu-sed gnu-which grep make ruby

PATH=$HOME/.linuxbrew/bin:$HOME/.linuxbrew/sbin
brew install hello && brew test hello; brew remove hello