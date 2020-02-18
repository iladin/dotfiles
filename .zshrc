export SHELL=$(which zsh)
export PS4=$'Time:%* File:%x Lineno:%I In:%N '
## Profiling code
#exec 3>&2 2>/tmp/zshstart.$$.log
#setopt xtrace prompt_subst

HISTFILE=~/.zsh_history
SAVEHIST=10000
HISTSIZE=1200
setopt APPEND_HISTORY

setopt HIST_EXPIRE_DUPS_FIRST



test -e $HOME/.zsh.local.before && source $HOME/.zsh.local.before

fpath=(${ZDOTDIR:-$HOME}/.zsh $fpath)
cfg () {   git --git-dir=${ZDOTDIR:-$HOME}/.cfg/ --work-tree=$HOME $@ }
test -d ${ZDOTDIR:-$HOME}/.cfg || (git clone --bare https://gitlab.com/iladin/dotfiles.git  $HOME/.cfg; mkdir -p "$HOME/.cfg-backup")
test -e $HOME/.flags/noCheckOut || cfg checkout 2> /dev/null || cfg checkout 2>&1 | sed 's/^M//g' | egrep "^[[:space:]]" | awk '$1=$1' |\
    while read -r file; do mv "$HOME/$file" "$HOME/.cfg-backup/$file" 2> /dev/null || unlink "$HOME/$file" 2> /dev/null ;done
test -e $HOME/.flags/noCheckOut || cfg checkout --force
cfg config status.showUntrackedFiles no

# language configuration
export LANG=en_US.UTF-8
export LOCALE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

export GOPATH="$HOME/.gopath"
declare -f pathadd || source ${ZDOTDIR:-$HOME}/.functions.sh
stat -t ${ZDOTDIR:-$HOME}/.*/bin &> /dev/null && pathadd ${ZDOTDIR:-$HOME}/.*/bin
pathadd . ${ZDOTDIR:-$HOME}/bin /usr/local/bin /usr/local/sbin ${ZDOTDIR:-$HOME}/junest/bin ${ZDOTDIR:-$HOME}/.local/bin

# Remove trailing slashes at end of path and at the end of each entry. Makes brew happy
export PATH=${${PATH//\/:/:}%/}
source ${ZDOTDIR:-$HOME}/.alias.zsh

# install TPM if not already installed
[ -d ${ZDOTDIR:-$HOME}/.config/tmux/plugins/tpm ] || git clone https://github.com/tmux-plugins/tpm ${ZDOTDIR:-$HOME}/.config/tmux/plugins/tpm
[ -d ${ZDOTDIR:-$HOME}/.tmux-gitbar ] || git clone https://github.com/aurelien-rainone/tmux-gitbar.git ~/.tmux-gitbar NULB

typeset -U path


[ -e ${ZDOTDIR:-$HOME}/.gdbinit ] || wget -P ~ git.io/.gdbinit # https://github.com/cyrus-and/gdb-dashboard NULB


#Command-line productivity booster, offers quick access to files and directories, inspired by autojump, z and v
hash fasd 2> /dev/null && eval "$(fasd --init auto)"

source ${ZDOTDIR:-$HOME}/.zplugin.zsh

# Moved from zsh plugin into .zshrc.

dzstyle(){
# zstyle ‘:completion:function:completer:command:argument:tag’

# Do menu-driven completion.
hash dircolors &> /dev/null && zstyle ':completion:*' menu select=2 eval "$(dircolors -b)"
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' menu select=long
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' separate-sections 'yes'
zstyle ':completion:*' list-dirs-first true


# list of completers to use
zstyle ':completion:*::::' completer _expand _complete _ignored _approximate

# ignore completion to commands we don't have
zstyle ':completion:*:functions'          ignored-patterns '_*'

# Use cache
zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path "${ZDOTDIR:-$HOME}/.zcompcache"

#style’s value will be the description for options not described by functions
zstyle ':completion:*:options' auto-description '%d'

# Refer to your own processes
zstyle ':completion:*:*:*:*:processes' command 'ps -u $LOGNAME -o pid,user,command -w'
# colorful kill completion
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;36=0=01'
# zstyle kill menu
zstyle ':completion:*:*:kill:*'           menu yes select
zstyle ':completion:*:kill:*'             force-list always




# Color completion for some things.
#zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# Fallback to built in ls colors
zstyle ':completion:*' list-colors ''
## Highlight parameters with uncommon names
zstyle ':completion:*:parameters' list-colors "=[^a-zA-Z]*=$color[red]"
# Highlight aliases
zstyle ':completion:*:aliases' list-colors "=*=$color[green]"
# Highlight the original input.
zstyle ':completion:*:original' list-colors "=*=$color[red];$color[bold]"
# Colorize hostname completion
zstyle ':completion:*:*:*:*:hosts' list-colors "=*=$color[cyan];$color[bg-black]"


zstyle ':completion:*:cd:*' ignore-parents parent pwd

# completion sorting
zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters

# Manpages
zstyle ':completion:*:manuals'       separate-sections true
zstyle ':completion:*:manuals.(^1*)' insert-sections   true

# formatting and messages
zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' verbose yes
zstyle ':completion:*' completer _expand _complete _match _prefix _approximate _list _history
zstyle ':completion:*:*files' ignored-patterns '*?.o' '*?~' '*\#'
zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:descriptions' format "$fg[yellow]%B--- %d%b"
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format "$fg[red]No matches for:$reset_color %d"
zstyle ':completion:*:corrections' format '%B%d (errors: %e)%b'
zstyle ':completion:*' group-name ''

zstyle '*' single-ignored show

# With commands like `rm' it's annoying if one gets offered the same filename
# again even if it is already on the command line. To avoid that:
zstyle ':completion::*:(git|less|rm)' ignore-line true

# SSH Completion
zstyle ':completion:*:scp:*' tag-order files 'hosts:-domain:domain'
zstyle ':completion:*:scp:*' group-order files all-files users hosts-domain hosts-host hosts-ipaddr
zstyle ':completion:*:(rsync|ssh):*' tag-order 'hosts:-domain:domain'
zstyle ':completion:*:(rsync|ssh):*' group-order hosts-domain hosts-host users hosts-ipaddr

# default: --
zstyle ':completion:*' list-separator '-->'
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*:manuals' separate-sections true

zstyle ':completion:*:*:*:users' ignored-patterns \
        adm amanda apache avahi beaglidx bin cacti canna clamav daemon \
        dbus distcache dovecot fax ftp games gdm gkrellmd gopher \
        hacluster haldaemon halt hsqldb ident junkbust ldap lp mail \
        mailman mailnull mldonkey mysql nagios \
        named netdump news nfsnobody nobody nscd ntp nut nx openvpn \
        operator pcap postfix postgres privoxy pulse pvm quagga radvd \
        rpc rpcuser rpm shutdown squid sshd sync uucp vcsa xfs

zstyle ':completion:*:*:(cd):*:*files' ignored-patterns '*~' file-sort access
zstyle ':completion:*:*:(cd):*'        file-sort access
zstyle ':completion:*:*:(cd):*'        menu select
zstyle ':completion:*:*:(cd):*'        completer _history


# Menu select
zmodload -i zsh/complist
bindkey -M menuselect '^h' vi-backward-char
bindkey -M menuselect '^j' vi-down-line-or-history
bindkey -M menuselect '^k' vi-up-line-or-history
bindkey -M menuselect '^l' vi-forward-char
#}}}
}
dzstyle

compdef g='git'
compdef cfg='git'

## From grml

# don't complete backup files as executables
zstyle ':completion:*:complete:-command-::commands' ignored-patterns '(aptitude-*|*\~)'

globalias() {
    zle _expand_alias
    zle expand-word
    zle self-insert
}
zle -N globalias

# control-space expands all aliases, including global
bindkey -M emacs "^ " globalias
bindkey -M viins "^ " globalias

# space to make a normal space
bindkey -M emacs " " magic-space
bindkey -M viins " " magic-space

# # normal space during searches
bindkey -M isearch " " magic-space


test -d ${ZDOTDIR:-$HOME}/.zplug || source ${ZDOTDIR:-$HOME}/.zplug.zsh NULB

#TODO put this into last-command.zsh and source it, give credit to skpw
# Use Ctrl-x,Ctrl-l to get the output of the last command
zmodload -i zsh/parameter
insert-last-command-output() {
LBUFFER+="$(eval $history[$((HISTCMD-1))])"
}
zle -N insert-last-command-output
bindkey "^X^L" insert-last-command-output



#####################################################################
# options
######################################################################
#{{{
setopt auto_resume
# Ignore <C-d> logout
#setopt ignore_eof
# Disable beeps
setopt no_beep
# {a-c} -> a b c
setopt brace_ccl
# Enable spellcheck
setopt correct
# Enable "=command" feature
setopt equals
# Disable flow control
setopt no_flow_control
# Ignore dups
setopt hist_ignore_dups
# Reduce spaces
setopt hist_reduce_blanks
# Ignore add history if space
setopt hist_ignore_space
# Save time stamp
setopt extended_history
# Expand history
setopt hist_expand
# Better jobs
setopt long_list_jobs
# Enable completion in "--option=arg"
setopt magic_equal_subst
# Add "/" if completes directory
setopt mark_dirs
# Disable menu complete for vimshell
setopt no_menu_complete
setopt list_rows_first
# Expand globs when completion
setopt glob_complete
# Enable multi io redirection
setopt multios
# Can search subdirectory in $PATH
setopt path_dirs
# For multi byte
setopt print_eightbit
# Print exit value if return code is non-zero
setopt print_exit_value
setopt pushd_ignore_dups
setopt pushd_silent
# Short statements in for, repeat, select, if, function
setopt short_loops
# Ignore history (fc -l) command in history
setopt hist_no_store
# Save history line by line
setopt inc_append_history
setopt transient_rprompt
unsetopt promptcr
setopt hash_cmds
setopt numeric_glob_sort
# Enable comment string
setopt interactive_comments
# Improve rm *
setopt rm_star_wait
# Enable extended glob
setopt extended_glob
# Note: It is a lot of errors in script
# setopt no_unset
# Prompt substitution
setopt prompt_subst
if [[ ${VIMSHELL_TERM:-""} != "" ]]; then
    setopt no_always_last_prompt
else
    setopt always_last_prompt
fi
# List completion
setopt auto_list
setopt auto_param_slash
setopt auto_param_keys
# List like "ls -F"
setopt list_types
# Compact completion
setopt list_packed
setopt auto_cd
setopt auto_pushd
setopt pushd_minus
setopt pushd_ignore_dups
# Check original command in alias completion
setopt complete_aliases
unsetopt hist_verify

unsetopt nomatch

# }}}

#Fix for repeating exit =! 0
# See https://github.com/zdharma/zplugin/issues/45 for details
setopt no_printexitvalue

test -e $HOME/.zsh.local.after && source $HOME/.zsh.local.after
## Profiling code
#unsetopt xtrace
#exec 2>&3 3>&-
