#!/usr/bin/env bash
#TODO: ERROR CHECKING JEEZ
mkdir ~/tmp 2> /dev/null
cd ~/tmp
git clone https://gitlab.com/iladin/gnucobol.git
cd gnucobol/branches/gnu-cobol-2.0-debugger
./configure --without-db
make || exit 1
make check
sudo make install || exit 1
sudo ldconfig
cd ~/tmp
wget https://sourceforge.net/code-snapshots/svn/o/op/open-cobol/contrib/open-cobol-contrib-175-trunk.zip
unzip open-cobol-contrib*.zip
rm open-cobol-contrib*.zip
cd open-cobol-contrib*/tools/cobolmac
source comp-cobolmac.sh
sudo cp cobolmac /usr/bin/

