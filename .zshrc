[[ -d ~/.zplug ]] || {
  curl -sL get.zplug.sh | zsh
	source ~/.zplug/zplug && zplug update --self
}

source ~/Dotfiles/zsh/zplug/init.zsh
if ! zplug check --verbose; then
  zplug install
fi
zplug load --verbose
