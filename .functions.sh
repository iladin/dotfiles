
function pathadd() {
  for ARG in "$@"
  do
    if [[ ! -d $ARG ]] ; then
        continue
        fi
    if [ -d "$ARG" ] && [[ ":$PATH:" != *":$ARG:"* ]]; then
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


function gout() {
if [[ -z $1 ]]; then
    echo "$gout"
else
    export gout=$("$@")
    echo "$gout"
fi
}
