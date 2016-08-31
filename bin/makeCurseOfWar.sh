cd $TMPDIR
git clone https://github.com/a-nikolaev/curseofwar.git
cd curseofwar
make SDL=yes DESTDIR=$HOME/.local install

