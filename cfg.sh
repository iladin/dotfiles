set -xv
cfg () {
   git --git-dir=$HOME/.cfg/ --work-tree=$HOME $@
}
if [[ ! -d $HOME/.cfg ]]; then
 git clone --bare $(git config --get remote.origin.url)  $HOME/.cfg
 mkdir -p "$HOME/.cfg-backup"
fi
 cfg checkout
 if [ $? = 0 ]; then
   echo "Checked out config.";
   else
     echo "Backing up pre-existing dot files.";
     cfg checkout 2>&1 | sed 's/^M//g' | egrep "^[[:space:]]" | awk '$1=$1' |\
         while read -r file
         do
              mv "$HOME/$file" "$HOME/.cfg-backup/$file" || unlink "$HOME/$file"
         done
 fi;
 cfg checkout --force
 cfg config status.showUntrackedFiles no
 set +xv
