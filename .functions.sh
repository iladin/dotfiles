#!/usr/bin/bash
function path_remove {
  # Delete path by parts so we can never accidentally remove sub paths
  PATH=${PATH//":$1:"/":"} # delete any instances in the middle
  PATH=${PATH/#"$1:"/} # delete any instance at the beginning
  PATH=${PATH/%":$1"/} # delete any instance in the at the end
}

function pathadd() {
  for ARG in "$@"
  do
    if [[ ! -d $ARG ]] ; then
        continue
        fi
    if [ -d "$ARG" ]; then
     if [[ ! ":$PATH:" != *":$ARG:"* ]]; then
        path_remove "$ARG"
     fi
     export PATH="${PATH:+"$PATH:"}$ARG"
    fi
  done
}
function pathpre() {
  for ARG in "$@"
  do
    if [[ ! -d $ARG ]] ; then
        continue
        fi
    if [ -d "$ARG" ] && [[ ":$PATH:" != *":$ARG:"* ]]; then
        export PATH="$ARG:$PATH:"
    fi
  done
}


function grab(){
    test -z $1 && echo "$grab" || grab=$("$@"); echo "$grab"
}
function gout() {
if [[ -z $1 ]]; then
    echo "$gout"
else
    export gout=$("$@")
    echo "$gout"
fi
}
function diskMap(){
    paste -d= <(iostat -x | awk 'NR>2{print $1}') <(iostat -nx | awk 'NR>2{print "/dev/dsk/"$11}')
}
function settitle() {
    printf "\033k$1\033\\"
}
function getSum(){
    awk '{s+=$1} END {print s}' $1
}
function getColumn(){
    first="awk '{print "
    last="}'"
    cmd="${first}\$${1}${last}"
    eval $cmd
}
#Get memory usage by user
function getUserMemoryUsage(){
ps -eo user,rss | perl -e 'open(F, "/etc/passwd"); foreach $l (<F>) { if ($l=~/(.*?):.*?:(\d+)/) { $users{$2}=$1; }}; foreach (<>) { m/(\w+)\s+(\d+)/; $mem{$1} += $2; }; foreach $u (keys (%mem)) { $UN = $u; if ($UN=~/^\d+$/) { $UN = $users{$UN};}; if ($mem{$u}) { print "$UN - $mem{$u}\n" }}' | sort
}
function getProccessMemoryUsage(){
sudo pmap -x $1 | tee >(head -1) >(tail -1) > /dev/null
}
function sortMemory(){
sort -n -k3,3 <(getUserMemoryUsage)
}
function funWithtput(){
for (( i = 0; i < 17; i++ ))
do
    echo "$(tput setaf $i)This is ($i) $(tput sgr0)"
done
}
function showinodes(){
find $1 -xdev -printf '%h\n' 2> /dev/null | sort | uniq -c | sort -k 1 -n
}
#Get Info from commandlinefu
function cmdfu(){
     curl "http://www.commandlinefu.com/commands/matching/$(echo "$@" \
    | sed 's/ /-/g')/$(echo -n $@ | base64)/plaintext" ;
}
## DICTIONARY FUNCTIONS ##
function dwordnet () { curl dict://dict.org/d:${1}:wn; }
function dacron () { curl dict://dict.org/d:${1}:vera; }
function djargon () { curl dict://dict.org/d:${1}:jargon; }
function dfoldoc () { curl dict://dict.org/d:${1}:foldoc; }
function dthesaurus () { curl dict://dict.org/d:${1}:moby-thes; }

function getPath() {
  type -p "$1" | cut -d ' ' -f 3
}
#TODO: Have this work for everyone
function beiladin(){ test -e ~/.gitconfig.user || echo "[user]\nname=iladin\nemail=iladin@gmail.com" > ~/.gitconfig.user && cat ~/.gitconfig.user ;}

# =: front for the `bc` utility  {{{

# credits: original idea by github.com/arzzen/calc.plugin.zsh
# usage: = '1+1'
= () {
  bc -l <<< "$@"
}

# }}}

# md: faster dir creation {{{

md() {
  mkdir -p $1
  builtin cd $1
}

# }}}

# ct: color toggle {{{

function ct(){
    if [[ $TERM != xterm-mono ]]; then
        export OLDTERM=$TERM
        export TERM=xterm-mono
    else
        test -z $OLDTERM && export TERM=$OLDTERM || echo "fail, OLDTERM unset"
    fi
}
# }}}
function d2u(){
    tr -d '\r' < $1 > $1.tmp && mv $1.tmp $1
}
function flagCheckout(){
    test -d $HOME/.flags || mkdir $HOME/.flags
    if [[ -e $HOME/.flags/noCheckOut ]]
        then rm $HOME/.flags/noCheckOut
        echo "noCheckout flag removed"
    else
        touch $HOME/.flags/noCheckOut
        echo "noCheckout flag created"
    fi
}

man() {
    LESS_TERMCAP_mb=$'\e[1;36m' \
    LESS_TERMCAP_md=$'\e[1;36m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[1;44;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[1;32m' \
    command man "$@"
}

function longestLine(){ grep -En "^.{$(wc -L < $1)}$" $1; }

function im(){ DEBIAN_FRONTEND=noninteractive eval $(!! 2>&1 | grep apt) -y; }

function dockerClean(){
    # Delete all containers
    docker rm $(docker ps -a -q)
    # Delete all images
    docker rmi $(docker images -q)
}
# Linux replacement for pargs on LINUX
if test `uname` = Linux; then
    function pargs { ps eww -p $1 | tail -n 1 | awk '{for(i=5;i<=NF;i++) printf( "argv[%s]: %s\n", i-5, $i  ); }'; }
fi
