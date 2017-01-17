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
setopt SHARE_HISTORY


test -e $HOME/.zsh.local.before && source $HOME/.zsh.local.before

fpath=(~/.zsh $fpath)
cfg () {   git --git-dir=$HOME/.cfg/ --work-tree=$HOME $@ }
test -d $HOME/.cfg || (git clone --bare https://gitlab.com/iladin/dotfiles.git  $HOME/.cfg; mkdir -p "$HOME/.cfg-backup")
test -e $HOME/.flags/noCheckOut || cfg checkout 2> /dev/null || cfg checkout 2>&1 | sed 's/^M//g' | egrep "^[[:space:]]" | awk '$1=$1' |\
    while read -r file; do mv "$HOME/$file" "$HOME/.cfg-backup/$file" 2> /dev/null || unlink "$HOME/$file" 2> /dev/null ;done
test -e $HOME/.flags/noCheckOut || cfg checkout --force
cfg config status.showUntrackedFiles no

source $HOME/.alias.zsh

# language configuration
export LANG=en_US.UTF-8
export LOCALE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

[ -d ~/.tmux-gitbar ] || git clone https://github.com/aurelien-rainone/tmux-gitbar.git ~/.tmux-gitbar NULB

typeset -U path

declare -f pathadd || source $HOME/.functions.sh
pathadd . $HOME/bin /usr/local/bin ~/.linuxbrew/{,s}bin ~/junest/bin ~/.local/bin
test -e $HOME/.gdbinit || wget -P ~ git.io/.gdbinit # https://github.com/cyrus-and/gdb-dashboard NULB
# fzf is a general-purpose command-line fuzzy finder.
[ -d ~/.fzf ] || (git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf ; ~/.fzf/install --no-update-rc --completion --key-bindings)
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPTS="--extended --ansi --multi"

#Command-line productivity booster, offers quick access to files and directories, inspired by autojump, z and v
hash fasd 2> /dev/null && eval "$(fasd --init auto)"

source $HOME/.zplugin.zsh

source $HOME/.zplug.zsh NULB

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
# }}}


test -e $HOME/.zsh.local.after && source $HOME/.zsh.local.after
## Profiling code
#unsetopt xtrace
#exec 2>&3 3>&-
