[[ -d ~/.zplugin ]] || {
    ZPLG_HOME="${ZDOTDIR:-$HOME}/.zplugin"

if ! test -d "$ZPLG_HOME"; then
    mkdir "$ZPLG_HOME"
    chmod g-rwX "$ZPLG_HOME"
fi

if test -d "$ZPLG_HOME/bin/.git"; then
    cd "$ZPLG_HOME/bin"
    git pull origin master
else
    cd "$ZPLG_HOME"
    git clone https://github.com/psprint/zplugin.git bin
fi
}
source ~/.zplugin/bin/zplugin.zsh
autoload -Uz compinit
compinit
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
zplug "sorin-ionescu/prezto", of:modules/gnu-utility
zplug "mrowa44/emojify", as:command, of:emojify

# fix garish, unreadable green and yellow node segment colours
POWERLEVEL9K_NODE_VERSION_BACKGROUND="red"
POWERLEVEL9K_NODE_VERSION_FOREGROUND="white"
zplug "bhilburn/powerlevel9k", of:powerlevel9k.zsh-theme
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status history time $TOOL_VERSION)
POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
POWERLEVEL9K_SHORTEN_DELIMITER=""
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"

export ZSH_PLUGINS_ALIAS_TIPS_TEXT='💡 '
if ! zplug check --verbose; then
  zplug install
fi
zplug load --verbose