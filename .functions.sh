function add_to_path_once() {
  test -d "$1" && path=("$1" $path)
}