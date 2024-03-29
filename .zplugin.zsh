function zzplugin() {
    ZPLG_HOME="${ZDOTDIR:-$HOME}/.zinit"
    [[ -d $ZPLG_HOME ]] || {
        if ! test -d "$ZPLG_HOME"; then
            mkdir "$ZPLG_HOME"
            chmod g-rwX "$ZPLG_HOME"
        fi
        if test -d "$ZPLG_HOME/bin/.git"; then
            cd "$ZPLG_HOME/bin"
            git pull origin master
        else
            cd "$ZPLG_HOME"
            git clone https://github.com/zdharma-continuum/zinit.git bin
            cd -
        fi
    }
    source ${ZPLG_HOME}/bin/zinit.zsh
    function zp_cmd() {
        zinit load "$@"
    }
}

zzplugin

# An oh-my-zsh plugin to help remembering those aliases you defined once
# Only use if you have python
if hash python 2>/dev/null; then
    zp_cmd "RobSis/zsh-completion-generator"
    zp_cmd "djui/alias-tips"
fi
#Generating zsh completion function from getopt-style help text.
autoload -Uz compinit && compinit -i

#Snippet expansion for zsh
zp_cmd "willghatch/zsh-snippets"
# shamelessly taken from add-zsh-hook, and modified to be able to run on user defined hook

zp_cmd "willghatch/zsh-hooks"

zp_cmd "robertzk/send.zsh"

zplugin snippet 'https://github.com/robbyrussell/oh-my-zsh/blob/master/plugins/git/git.plugin.zsh'
zplugin snippet 'https://github.com/robbyrussell/oh-my-zsh/blob/master/lib/git.zsh'

# Zplugin commands

# k is a zsh script / plugin to make directory listings more readable
#adding a bit of color and some git status information on files and directories.
zp_cmd "supercrabtree/k"

# peco/percol/fzf wrapper plugin for zsh
zp_cmd "mollifier/anyframe"

zp_cmd "jimhester/per-directory-history"

# A next-generation cd command with an interactive filter
export ENHANCD_FILTER=fzy:peco:fzf
#zp_cmd "b4b4r07/enhancd" #, of:enhancd.sh
zinit light b4b4r07/enhancd
#Emoji completion on the command line

zp_cmd "b4b4r07/emoji-cli"

zp_cmd "joshuarubin/zsh-homebrew"

hash docker &>/dev/null && zp_cmd "felixr/docker-zsh-completion"

#zp_cmd "zpm-zsh/linuxbrew"

#Incremental history word completing (started with Alt-h/H or Option-h/H on Mac)
zp_cmd "zdharma-continuum/zsh-editing-workbench"

#Because your terminal should be able to perform tasks asynchronously without external tools!
zp_cmd "mafredri/zsh-async"
#Plugin that provides zsnapshot command which dumps current ZSH state into a file, for restoration by sourcing the file
zp_cmd "zdharma-continuum/zsnapshot"
#A shell command that will display selection list
zp_cmd "zdharma-continuum/zsh-select"
#Curses-based tools for Zsh, e.g. multi-word history searcher
zp_cmd "zdharma-continuum/zsh-navigation-tools"
#Complete options from manual pages – press Ctrl-F to start the completer
zp_cmd "zdharma-continuum/zzcomplete"

zp_cmd "Tarrasch/zsh-autoenv" # zsh-autoenv automatically sources (known/whitelisted) .autoenv.zsh files, typically used in project root directories.

#THEME
#zp_cmd "sindresorhus/pure"
zinit ice depth=1; zinit light romkatv/powerlevel10k

#source $HOME/.powerlevel9k

#Install zsh-tig-plugin if tig is installed
hash tig &>/dev/null && zinit wait lucid for zdharma-continuum/zsh-tig-plugin

# zsh anything.el-like widget.
zp_cmd "zsh-users/zaw"

# Additional completion definitions for Zsh
zp_cmd "zsh-users/zsh-completions"
# Fish-like fast/unobtrusive autosuggestions for zsh.
zp_cmd "zsh-users/zsh-autosuggestions"
# Syntax highlighting bundle. zsh-syntax-highlighting must be loaded after
# excuting compinit command and sourcing other plugins.
zp_cmd "zdharma-continuum/fast-syntax-highlighting" #, nice:9
# ZSH port of Fish shell's history search feature
zp_cmd "zsh-users/zsh-history-substring-search" #, nice:10

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)

if [[ "$(tput colors)" == "256" ]]; then
    FAST_HIGHLIGHT_STYLES[default]=none
    FAST_HIGHLIGHT_STYLES[unknown-token]=fg=160
    FAST_HIGHLIGHT_STYLES[reserved-word]=fg=037,bold #,standout
    FAST_HIGHLIGHT_STYLES[alias]=fg=064,bold
    FAST_HIGHLIGHT_STYLES[builtin]=fg=064,bold
    FAST_HIGHLIGHT_STYLES[function]=fg=064,bold
    FAST_HIGHLIGHT_STYLES[command]=fg=064,bold
    FAST_HIGHLIGHT_STYLES[precommand]=fg=064,underline
    FAST_HIGHLIGHT_STYLES[commandseparator]=none
    FAST_HIGHLIGHT_STYLES[hashed-command]=fg=037
    FAST_HIGHLIGHT_STYLES[path]=fg=166,underline
    FAST_HIGHLIGHT_STYLES[globbing]=fg=033
    FAST_HIGHLIGHT_STYLES[history-expansion]=fg=white,underline
    FAST_HIGHLIGHT_STYLES[single-hyphen-option]=fg=125,bold
    FAST_HIGHLIGHT_STYLES[double-hyphen-option]=fg=125,bold
    FAST_HIGHLIGHT_STYLES[back-quoted-argument]=none
    FAST_HIGHLIGHT_STYLES[single-quoted-argument]=fg=136
    FAST_HIGHLIGHT_STYLES[double-quoted-argument]=fg=136
    FAST_HIGHLIGHT_STYLES[dollar-double-quoted-argument]=fg=136
    FAST_HIGHLIGHT_STYLES[back-double-quoted-argument]=fg=136
    FAST_HIGHLIGHT_STYLES[assign]=fg=037
fi

export ZSH_PLUGINS_ALIAS_TIPS_TEXT='💡 '

function zplugin_end() {
    zinit cdreplay -q # -q is for quiet
    autoload -Uz _zinit
    zcompile ${ZDOTDIR:-$HOME}/.zinit/bin/zinit.zsh
}

#if whence -f zplugin; then zplugin_end; else zplug_end; fi
zplugin_end
