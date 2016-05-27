source ~/Dotfiles/zsh/zplug/init.zsh
if ! zplug check --verbose; then
  zplug install
fi
zplug load --verbose
