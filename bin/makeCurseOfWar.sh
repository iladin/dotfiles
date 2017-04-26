cd $TMPDIR
sudo apt install libsdl1.2-dev
rm -rf curseofwar
git clone https://github.com/a-nikolaev/curseofwar.git
cd curseofwar
sudo make SDL=yes install
