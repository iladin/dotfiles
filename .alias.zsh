alias .=source
alias ~="cd ~"
alias -- -="cd -"
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g CA="2>&1 | cat -A"
alias -g C='| wc -l'
alias -g D="DISPLAY=:0.0"
alias -g DN=/dev/null
alias -g ED="export DISPLAY=:0.0"
alias -g EG='|& egrep'
alias -g EH='|& head'
alias -g EL='|& less'
alias -g ELS='|& less -S'
alias -g ETL='|& tail -20'
alias -g ET='|& tail'
alias -g F=' | fmt -'
alias -g G='| egrep'
alias -g H='| head'
alias -g HL='|& head -20'
alias -g Sk="*~(*.bz2|*.gz|*.tgz|*.zip|*.z)"
alias -g LL="2>&1 | less"
alias -g L="| less"
alias -g LS='| less -S'
alias -g MM='| most'
alias -g M='| more'
alias -g NE="2> /dev/null"
alias -g NS='| sort -n'
alias -g NUL="> /dev/null 2>&1"
alias -g NULB="> /dev/null 2>&1 &"
alias -g PIPE='|'
alias -g RNS='| sort -nr'
alias -g S='| sort'
alias -g TL='| tail -20'
alias -g T='| tail'
alias -g US='| sort -u'
alias -g VM=/var/log/messages
alias -g X0G='| xargs -0 egrep'
alias -g X0='| xargs -0'
alias -g XG='| xargs egrep'
alias -g X='| xargs'

#Alias Alias
alias aliases=" (alias | cut -f1 -d= ; hash -f; hash -v | cut -f 1 -d= ; typeset +f) | sort"

# Use cut on space- or comma- delimited files:
alias cuts="cut -d \" \""
alias cutc="cut -d \",\""

#Get your external IP address
alias gip='dig +short myip.opendns.com @resolver1.opendns.com'
alias weather='curl wttr.in'

#Color for ls
export CLICOLOR=1
ls --color=auto &> /dev/null && alias ll='ls -lF --color=auto' \
&& alias la='ls -alF --color=auto' \
&& alias ls='ls -F --color=auto' \
&& alias lr='ls -alrtF --color=auto'

alias rty='export $(tmux showenv | grep DISPLAY)'

# Enable aliases to be sudoed
alias sudo='sudo '
alias vi=vim
# Homebrew

alias brewu='brew update  && brew upgrade --all && brew cleanup && brew prune && brew doctor'
# Functions
#
# (f)ind by (n)ame
# usage: fn foo
# to find all files containing 'foo' in the name

function fn() { ls **/*$1* ;}
# Split diff
alias sd="wid=\$(tput cols); sdiff -bisBEWZ -w \$wid"


# fixes compinit insecure directory bug.
alias fixAudit='compaudit NE | xargs chmod go-wx'


alias t='type -a'
alias pscpu='ps -auxf | sort -nr -k 3'
alias pscpu10='ps -auxf | sort -nr -k 3 | head -10'
alias psmem='ps -auxf | sort -nr -k 4'
alias psmem10='ps -auxf | sort -nr -k 4 | head -10'
alias ports='netstat -tulanp'
alias path="echo \"${PATH//:/$'\n'}\""
alias now='date +"%T"'
alias nowdate='date +"%d-%m-%Y"'
alias mostRecentFileInDir='ls -rt | tail -1'

# Docker
alias che='docker run --net=host --name che -v /var/run/docker.sock:/var/run/docker.sock -v /home/user/che/lib:/home/user/che/lib-copy -v /home/user/che/workspaces:/home/user/che/workspaces -v /home/user/che/storage:/home/user/che/storage codenvy/che'
alias codenvy='docker run -it --rm -v /var/tmp:/data -v /var/run/docker.sock:/var/run/docker.sock codenvy/cli start'
alias portainer='docker run -d -p 9000:9000 -v /var/run/docker.sock:/var/run/docker.sock portainer/portainer && echo "open me http://localhost:9000/"'
alias sen='docker run -v /var/run/docker.sock:/run/docker.sock -ti -e TERM tomastomecek/sen'

# Code
if hash code &> /dev/null; then
    if hash code-insiders &> /dev/null; then
        alias code='code-insiders'
    fi
fi
