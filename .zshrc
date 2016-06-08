
## Profiling code
#PS4=$'\\\011%D{%s%6.}\011%x\011%I\011%N\011%e\011'
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

test -e ~/.zplug.zsh && source ~/.zplug.zsh 


## Profiling code
#unsetopt xtrace
#exec 2>&3 3>&-
