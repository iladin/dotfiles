#!/usr/bin/env bash
#TODO: ERROR CHECKING JEEZ
sudo apt-get update
sudo apt-get -yqq install help2man texinfo
mkdir ~/tmp 2> /dev/null
cd ~/tmp
rm -rf opensource-cobol
git clone https://github.com/opensourcecobol/opensource-cobol.git
cd opensource-cobol/vbisam
chmod a+x configure
./configure
make cycle
sudo make install
sudo ldconfig
cd ~/tmp
test -d gnucobol && rm -rf gnucobol
git clone https://gitlab.com/gnu/cobol.git
cd gnucobol/branches/gnu-cobol-2.0-debugger
./configure --with-vbisam
make || exit 1
make check
sudo make install || exit 1
sudo ldconfig
cd ~/tmp
git svn clone svn://svn.code.sf.net/p/open-cobol/contrib/ open-cobol-contrib
cd open-cobol-contrib*/trunk/tools/cobolmac
sudo ldconfig
source comp-cobolmac.sh
sudo cp cobolmac /usr/bin
