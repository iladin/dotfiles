typeset -U path

source ${0:a:h}/cfg.sh
[[ -d ~/.zplug ]] || {
  curl -sL get.zplug.sh | zsh
	source ~/.zplug/zplug && zplug update --self
}

source ~/.zplug/init.zsh

zplug "bhilburn/powerlevel9k", use:powerlevel9k.zsh-theme
if ! zplug check --verbose; then
  zplug install
fi
zplug load --verbose
