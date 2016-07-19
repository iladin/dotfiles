

export PS4=$'Time:%* File:%x Lineno:%I In:%N '
## Profiling code
#exec 3>&2 2>/tmp/zshstart.$$.log
#setopt xtrace prompt_subst
export wd="$(dirname -- ${0})"

source $wd/.alias.zsh

# language configuration
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8


export TERM="xterm-256color"
typeset -U path

declare -f pathadd || source $wd/.functions.sh

source $wd/cfg.sh

#source ~/.zplug.zsh
source $wd/.zplugin.zsh


## Profiling code
#unsetopt xtrace
#exec 2>&3 3>&-
