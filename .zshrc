export TERM="xterm-256color"
typeset -U path

test -e ~/.functions.sh && source ~/.functions.sh

source ${0:a:h}/cfg.sh

test -e ~/.zplug.zsh && source ~/.zplug.zsh 
