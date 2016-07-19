

export PS4=$'Time:%* File:%x Lineno:%I In:%N '
## Profiling code
#exec 3>&2 2>/tmp/zshstart.$$.log
#setopt xtrace prompt_subst

cfg () {   git --git-dir=$HOME/.cfg/ --work-tree=$HOME $@ }
test -d $HOME/.cfg || (git clone --bare $(git config --get remote.origin.url)  $HOME/.cfg; mkdir -p "$HOME/.cfg-backup")
cfg checkout || cfg checkout 2>&1 | sed 's/^M//g' | egrep "^[[:space:]]" | awk '$1=$1' |\
    while read -r file; do mv "$HOME/$file" "$HOME/.cfg-backup/$file" || unlink "$HOME/$file" ;done
cfg checkout --force
cfg config status.showUntrackedFiles no

export wd="$(dirname -- ${0})"

source $wd/.alias.zsh

# language configuration
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8


export TERM="xterm-256color"
typeset -U path

declare -f pathadd || source $wd/.functions.sh


#source ~/.zplug.zsh
source $wd/.zplugin.zsh


## Profiling code
#unsetopt xtrace
#exec 2>&3 3>&-
