git clone https://github.com/fsquillace/junest ~/junest
export PATH=~/junest/bin:$PATH
if [[ $(id -u) -ne 0 ]]; then
    junest -f -- pacman --noconfirm -Sy zsh awk pkgfile grep git
else
    junest -f --groot  -- pacman --noconfirm -Sy zsh awk pkgfile grep git
fi

