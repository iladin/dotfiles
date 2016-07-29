#!/usr/bin/env bash
#TODO: ERROR CHECKING JEEZ
mkdir ~/tmp 2> /dev/null
cd ~/tmp
test -d gnucobol && rm -rf gnucobol
git clone https://gitlab.com/iladin/gnucobol.git
cd gnucobol/branches/gnu-cobol-2.0-debugger
./configure --without-db
make || exit 1
make check
sudo make install || exit 1
sudo ldconfig
cd ~/tmp
git svn checkout svn://svn.code.sf.net/p/open-cobol/contrib/ open-cobol-contrib
cd open-cobol-contrib*/trunk/tools/cobolmac
source comp-cobolmac.sh
cp cobolmac $HOME/bin

