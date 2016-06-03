[[ -d ~/.zplug ]] || {
  curl -sL get.zplug.sh | zsh
  source ~/.zplug/zplug && zplug update --self
}
source ~/.zplug/init.zsh
# Additional completion definitions for Zsh
zplug "zsh-users/zsh-completions"
# Fish-like fast/unobtrusive autosuggestions for zsh.
zplug "zsh-users/zsh-autosuggestions"
# Syntax highlighting bundle. zsh-syntax-highlighting must be loaded after
# excuting compinit command and sourcing other plugins.
zplug "zsh-users/zsh-syntax-highlighting", nice:9
# ZSH port of Fish shell's history search feature
zplug "zsh-users/zsh-history-substring-search", nice:10
# k is a zsh script / plugin to make directory listings more readable
zplug "supercrabtree/k"
# A fully-functional bash client for tldr.
zplug "raylee/tldr", as:command
# peco/percol/fzf wrapper plugin for zsh
zplug "mollifier/anyframe"
# An oh-my-zsh plugin to help remembering those aliases you defined once
zplug "djui/alias-tips"
# zsh anything.el-like widget.
zplug "zsh-users/zaw"
# A next-generation cd command with an interactive filter
zplug "b4b4r07/enhancd", of:enhancd.sh
#Emoji completion on the command line
zplug "b4b4r07/emoji-cli", of:emoji-cli.zsh

zplug "joshuarubin/zsh-homebrew"
zplug "junegunn/fzf", of:shell/key-bindings.zsh

zplug "sorin-ionescu/prezto", of:modules/git/alias.zsh
zplug "mrowa44/emojify", as:command, of:emojify


zplug "bhilburn/powerlevel9k", use:powerlevel9k.zsh-theme
if ! zplug check --verbose; then
  zplug install
fi
zplug load --verbose
