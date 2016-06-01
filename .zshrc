typeset -U path

function add_to_path_once() {
  path=("$1" $path)
}

source ${0:a:h}/cfg.sh

test -e ~/.zplug.zsh && source ~/.zplug.zsh 