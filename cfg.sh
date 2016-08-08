cfg () {   git --git-dir=$HOME/.cfg/ --work-tree=$HOME $@ }
test -d $HOME/.cfg || (git clone --bare https://gitlab.com/iladin/dotfiles.git  $HOME/.cfg; mkdir -p "$HOME/.cfg-backup")
cfg checkout 2> /dev/null || cfg checkout 2>&1 | sed 's/^M//g' | egrep "^[[:space:]]" | awk '$1=$1' |\
    while read -r file; do mv "$HOME/$file" "$HOME/.cfg-backup/$file" 2> /dev/null || unlink "$HOME/$file" 2> /dev/null ;done
cfg checkout --force
cfg config status.showUntrackedFiles no
