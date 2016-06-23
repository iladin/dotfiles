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
zplugin load "zsh-users/zsh-completions"


# ZSH port of Fish shell's history search feature
zplugin load "zsh-users/zsh-history-substring-search" #, nice:10
# k is a zsh script / plugin to make directory listings more readable
zplugin load "supercrabtree/k"
# A fully-functional bash client for tldr.
zplugin load "raylee/tldr" #, as:command
# peco/percol/fzf wrapper plugin for zsh
zplugin load "mollifier/anyframe"
# An oh-my-zsh plugin to help remembering those aliases you defined once
zplugin load "djui/alias-tips"
# zsh anything.el-like widget.
zplugin load "zsh-users/zaw"
# fzf is a general-purpose command-line fuzzy finder.
zplugin load "junegunn/fzf" #, of:shell/key-bindings.zsh
# A next-generation cd command with an interactive filter
zplugin load "b4b4r07/enhancd" #, of:enhancd.sh
#Emoji completion on the command line
zplugin load "b4b4r07/emoji-cli" #, of:emoji-cli.zsh

zplugin load "joshuarubin/zsh-homebrew"

hash docker &> /dev/null && zplugin load  "felixr/docker-zsh-completion"

zplugin snippet "https://github.com/sorin-ionescu/prezto/blob/master/modules/git/alias.zsh" 
zplugin load "mrowa44/emojify" #, as:command, of:emojify
#Incremental history word completing (started with Alt-h/H or Option-h/H on Mac)
zplugin load "psprint/zsh-editing-workbench"
#To make Alt key work like expected under XTerm add XTerm*metaSendsEscape: true to your resource file, e.g.:
grep metaSendsEscape ~/.Xresources &> /dev/null || echo 'XTerm*metaSendsEscape: true' >> ~/.Xresources
#Plugin that provides zsnapshot command which dumps current ZSH state into a file, for restoration by sourcing the file
zplugin load "psprint/zsnapshot"

# A script to make using 256 colors in zsh less painful.
zplugin snippet 'https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/lib/spectrum.zsh'

zplugin snippet 'http://github.com/robbyrussell/oh-my-zsh/raw/master/lib/git.zsh'
#Command-line productivity booster, offers quick access to files and directories, inspired by autojump, z and v
zplugin snippet 'https://github.com/skwp/dotfiles/blob/master/bin/fasd'
#k is a zsh script / plugin to make directory listings more readable,
#adding a bit of color and some git status information on files and directories.
zplugin load "supercrabtree/k"

zplugin load "iladin/oh-my-git"
zplugin snippet 'https://github.com/arialdomartini/oh-my-git-themes/blob/master/oppa-lana-style.zsh-theme'
setopt prompt_subst

# Fish-like fast/unobtrusive autosuggestions for zsh.
zplugin load "zsh-users/zsh-autosuggestions"
# Syntax highlighting bundle. zsh-syntax-highlighting must be loaded after
# excuting compinit command and sourcing other plugins.
zplugin load "zsh-users/zsh-syntax-highlighting" #, nice:9

export ZSH_PLUGINS_ALIAS_TIPS_TEXT='💡 '
autoload -Uz _zplugin
#(( ${+_comps} )) && _comps[zplugin]=_zplugin
zcompile ~/.zplugin/bin/zplugin.zsh
