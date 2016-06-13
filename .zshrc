

export PS4=$'Time: %* File: %x Lineno: %I In: %N Depth: %e'
## Profiling code
#exec 3>&2 2>/tmp/zshstart.$$.log
#setopt xtrace prompt_subst

source ~/.alias.sh 

# language configuration
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8


export TERM="xterm-256color"
typeset -U path

test -e ~/.functions.sh && source ~/.functions.sh

source ${0:a:h}/cfg.sh

#source ~/.zplug.zsh 
source ~/.zplugin.zsh 


## Profiling code
#unsetopt xtrace
#exec 2>&3 3>&-
