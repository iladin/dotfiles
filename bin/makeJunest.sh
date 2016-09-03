git clone https://github.com/fsquillace/junest ~/junest
export PATH=~/junest/bin:$PATH
junest -f -- pacman --noconfirm -Sy zsh awk pkgfile grep
