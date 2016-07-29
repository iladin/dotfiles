#!/usr/bin/env bash
#TODO: ERROR CHECKING JEEZ
mkdir ~/tmp 2> /dev/null
cd ~/tmp
rm -rf opensource-cobol/vbisam
git clone https://github.com/opensourcecobol/opensource-cobol.git
cd opensource-cobol/vbisam
./configure
make
sudo make install
cd ~/tmp
test -d gnucobol && rm -rf gnucobol
git clone https://gitlab.com/iladin/gnucobol.git
cd gnucobol/branches/gnu-cobol-2.0-debugger
./configure --with-vbisam
make || exit 1
make check
sudo make install || exit 1
sudo ldconfig
cd ~/tmp
git svn checkout svn://svn.code.sf.net/p/open-cobol/contrib/ open-cobol-contrib
cd open-cobol-contrib*/trunk/tools/cobolmac
source comp-cobolmac.sh
sudo cp cobolmac /usr/bin

