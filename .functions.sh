function pathadd() {
  test -d "$1" && path=("$1" $path)
}

function gout() {
if [[ -z $1 ]]; then
    echo "$gout"
else
    export gout=$("$@")
    echo "$gout"
fi
}
