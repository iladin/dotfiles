
function zzplugin(){
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
}
zzplugin
autoload -Uz compinit
compinit

zplugin load "iladin/zstyle"

# k is a zsh script / plugin to make directory listings more readable
#adding a bit of color and some git status information on files and directories.
zplugin load "supercrabtree/k"
# A fully-functional bash client for tldr.
zplugin load "raylee/tldr" #, as:command
# peco/percol/fzf wrapper plugin for zsh
zplugin load "mollifier/anyframe"
# An oh-my-zsh plugin to help remembering those aliases you defined once
# Only use if you have python
hash python && zplugin load "djui/alias-tips"


# A next-generation cd command with an interactive filter
zplugin load "b4b4r07/enhancd" #, of:enhancd.sh
#Emoji completion on the command line
zplugin load "b4b4r07/emoji-cli"

zplugin load "joshuarubin/zsh-homebrew"

hash docker &> /dev/null && zplugin load  "felixr/docker-zsh-completion"

zplugin snippet 'https://github.com/robbyrussell/oh-my-zsh/blob/master/plugins/git/git.plugin.zsh'
zplugin snippet 'https://github.com/robbyrussell/oh-my-zsh/blob/master/lib/git.zsh'

zplugin load "mrowa44/emojify" #, as:command, of:emojify
#Incremental history word completing (started with Alt-h/H or Option-h/H on Mac)
zplugin load "psprint/zsh-editing-workbench"


#Plugin that provides zsnapshot command which dumps current ZSH state into a file, for restoration by sourcing the file
zplugin load "psprint/zsnapshot"
#A shell command that will display selection list
zplugin load "psprint/zsh-select"
#Curses-based tools for Zsh, e.g. multi-word history searcher
zplugin load "psprint/zsh-navigation-tools"
#Complete options from manual pages – press Ctrl-F to start the completer
zplugin load "psprint/zzcomplete"
#Record output of commands, reuse it via curses interface
zplugin load "psprint/ztrace"

# A script to make using 256 colors in zsh less painful.
zplugin snippet 'https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/lib/spectrum.zsh'


#zsh-autoenv automatically sources (known/whitelisted) .autoenv.zsh files, typically used in project root directories.
zplugin load "Tarrasch/zsh-autoenv" # zsh-autoenv automatically sources (known/whitelisted) .autoenv.zsh files, typically used in project root directories.

#Command-line productivity booster, offers quick access to files and directories, inspired by autojump, z and v
zplugin snippet 'https://github.com/skwp/dotfiles/blob/master/bin/fasd'

source $HOME/.powerlevel9k
#zplugin load "iladin/oh-my-git"
#zplugin snippet 'https://github.com/arialdomartini/oh-my-git-themes/blob/master/oppa-lana-style.zsh-theme'
#test -d $HOME/.git-radar || git clone https://github.com/michaeldfallen/git-radar $HOME/.git-radar;
#test -d $HOME/.git-radar && pathadd $HOME/.git-radar && export PROMPT="$PROMPT\$(git-radar --zsh --fetch) "


# Use Ctrl-x,Ctrl-l to get the output of the last command
zplugin snippet "https://github.com/skwp/dotfiles/blob/master/zsh/last-command.zsh"

# zsh anything.el-like widget.
zplugin load "zsh-users/zaw"
# ZSH port of Fish shell's history search feature
zplugin load "zsh-users/zsh-history-substring-search" #, nice:10
# Additional completion definitions for Zsh
zplugin load "zsh-users/zsh-completions"
# Fish-like fast/unobtrusive autosuggestions for zsh.
zplugin load "zsh-users/zsh-autosuggestions"
# Syntax highlighting bundle. zsh-syntax-highlighting must be loaded after
# excuting compinit command and sourcing other plugins.
zplugin load "zsh-users/zsh-syntax-highlighting" #, nice:9

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)

if [[ "$(tput colors)" == "256" ]]; then
    ZSH_HIGHLIGHT_STYLES[default]=none
    ZSH_HIGHLIGHT_STYLES[unknown-token]=fg=160
    ZSH_HIGHLIGHT_STYLES[reserved-word]=fg=037,bold #,standout
    ZSH_HIGHLIGHT_STYLES[alias]=fg=064,bold
    ZSH_HIGHLIGHT_STYLES[builtin]=fg=064,bold
    ZSH_HIGHLIGHT_STYLES[function]=fg=064,bold
    ZSH_HIGHLIGHT_STYLES[command]=fg=064,bold
    ZSH_HIGHLIGHT_STYLES[precommand]=fg=064,underline
    ZSH_HIGHLIGHT_STYLES[commandseparator]=none
    ZSH_HIGHLIGHT_STYLES[hashed-command]=fg=037
    ZSH_HIGHLIGHT_STYLES[path]=fg=166,underline
    ZSH_HIGHLIGHT_STYLES[globbing]=fg=033
    ZSH_HIGHLIGHT_STYLES[history-expansion]=fg=white,underline
    ZSH_HIGHLIGHT_STYLES[single-hyphen-option]=fg=125,bold
    ZSH_HIGHLIGHT_STYLES[double-hyphen-option]=fg=125,bold
    ZSH_HIGHLIGHT_STYLES[back-quoted-argument]=none
    ZSH_HIGHLIGHT_STYLES[single-quoted-argument]=fg=136
    ZSH_HIGHLIGHT_STYLES[double-quoted-argument]=fg=136
    ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]=fg=136
    ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]=fg=136
    ZSH_HIGHLIGHT_STYLES[assign]=fg=037
fi




export ZSH_PLUGINS_ALIAS_TIPS_TEXT='💡 '
zplugin cdreplay -q # -q is for quiet
autoload -Uz _zplugin
#(( ${+_comps} )) && _comps[zplugin]=_zplugin
zcompile ~/.zplugin/bin/zplugin.zsh
