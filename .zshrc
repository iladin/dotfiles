[[ -d ~/.zplug ]] || {
	curl -fLo ~/.zplug/zplug --create-dirs https://git.io/zplug
	source ~/.zplug/zplug && zplug update --self
}

source ~/Dotfiles/zsh/zplug/init.zsh
if ! zplug check --verbose; then
  zplug install
fi
zplug load --verbose
