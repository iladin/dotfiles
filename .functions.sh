function pathadd() {
  test -d "$1" && path=("$1" $path)
}