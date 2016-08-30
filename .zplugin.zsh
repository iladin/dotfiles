
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
    zp_cmd="eval zplugin load"
}

function zzplug(){
    export ZPLUG_HOME="${ZDOTDIR:-$HOME}/.zplug"
    test -e $ZPLUG_HOME || git clone https://github.com/zplug/zplug $ZPLUG_HOME
    source ~/.zplug/init.zsh
    zp_cmd="zplug"
}

zzplugin
autoload -Uz compinit
compinit

$zp_cmd "iladin/zstyle"

# k is a zsh script / plugin to make directory listings more readable
#adding a bit of color and some git status information on files and directories.
$zp_cmd "supercrabtree/k"
# A fully-functional bash client for tldr.
$zp_cmd "raylee/tldr" , as:command
# peco/percol/fzf wrapper plugin for zsh
$zp_cmd "mollifier/anyframe"
# An oh-my-zsh plugin to help remembering those aliases you defined once
# Only use if you have python
hash python && $zp_cmd "djui/alias-tips"


# A next-generation cd command with an interactive filter
$zp_cmd "b4b4r07/enhancd" #, of:enhancd.sh
#Emoji completion on the command line
$zp_cmd "b4b4r07/emoji-cli"

$zp_cmd "joshuarubin/zsh-homebrew"

hash docker &> /dev/null && $zp_cmd  "felixr/docker-zsh-completion"

if [[ $zp_cmd = "zplugin load" ]]; then
    zplugin snippet 'https://github.com/robbyrussell/oh-my-zsh/blob/master/plugins/git/git.plugin.zsh'
    zplugin snippet 'https://github.com/robbyrussell/oh-my-zsh/blob/master/lib/git.zsh'
    zplugin snippet 'https://raw.githubusercontent.com/mchav/with/master/with'
    # A script to make using 256 colors in zsh less painful.
    zplugin snippet 'https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/lib/spectrum.zsh'
else
    zplug "plugins/git",   from:oh-my-zsh
    zplug "lib/git", from:oh-my-zsh
    zplug "lib/git", from:oh-my-zsh
    zplug "mchav/with", as:command
fi
$zp_cmd "mrowa44/emojify" #, as:command, of:emojify
#Incremental history word completing (started with Alt-h/H or Option-h/H on Mac)
$zp_cmd "psprint/zsh-editing-workbench"

#Because your terminal should be able to perform tasks asynchronously without external tools!
$zp_cmd "mafredri/zsh-async"
#Plugin that provides zsnapshot command which dumps current ZSH state into a file, for restoration by sourcing the file
$zp_cmd "psprint/zsnapshot"
#A shell command that will display selection list
$zp_cmd "psprint/zsh-select"
#Curses-based tools for Zsh, e.g. multi-word history searcher
$zp_cmd "psprint/zsh-navigation-tools"
#Complete options from manual pages – press Ctrl-F to start the completer
$zp_cmd "psprint/zzcomplete"
#Record output of commands, reuse it via curses interface
$zp_cmd "psprint/ztrace"




#zsh-autoenv automatically sources (known/whitelisted) .autoenv.zsh files, typically used in project root directories.
$zp_cmd "Tarrasch/zsh-autoenv" # zsh-autoenv automatically sources (known/whitelisted) .autoenv.zsh files, typically used in project root directories.



source $HOME/.powerlevel9k
#$zp_cmd "iladin/oh-my-git"
#zplugin snippet 'https://github.com/arialdomartini/oh-my-git-themes/blob/master/oppa-lana-style.zsh-theme'
#test -d $HOME/.git-radar || git clone https://github.com/michaeldfallen/git-radar $HOME/.git-radar;
#test -d $HOME/.git-radar && pathadd $HOME/.git-radar && export PROMPT="$PROMPT\$(git-radar --zsh --fetch) "


# Use Ctrl-x,Ctrl-l to get the output of the last command
zplugin snippet "https://github.com/skwp/dotfiles/blob/master/zsh/last-command.zsh"

# zsh anything.el-like widget.
$zp_cmd "zsh-users/zaw"
# ZSH port of Fish shell's history search feature
$zp_cmd "zsh-users/zsh-history-substring-search" #, nice:10
# Additional completion definitions for Zsh
$zp_cmd "zsh-users/zsh-completions"
# Fish-like fast/unobtrusive autosuggestions for zsh.
$zp_cmd "zsh-users/zsh-autosuggestions"
# Syntax highlighting bundle. zsh-syntax-highlighting must be loaded after
# excuting compinit command and sourcing other plugins.
$zp_cmd "zsh-users/zsh-syntax-highlighting" #, nice:9

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

function zplug_end() {
    if ! zplug check --verbose; then
           zplug install
    fi
    zplug load --verbose
    }

function zplugin_end(){}
    zplugin cdreplay -q # -q is for quiet
    autoload -Uz _zplugin
    #(( ${+_comps} )) && _comps[zplugin]=_zplugin
    zcompile ~/.zplugin/bin/zplugin.zsh
}

if [[ zp_cmd = "zplugin load" ]]; then zplugin_end; else zplug_end; fi
