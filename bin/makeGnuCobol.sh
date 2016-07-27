#!/usr/bin/env bash
#TODO: ERROR CHECKING JEEZ
mkdir ~/tmp 2> /dev/null
cd ~/tmp
git svn clone svn://svn.code.sf.net/p/open-cobol/code

./configure
make
sudo make install
sudo ldconfig
cd ~/tmp
wget https://sourceforge.net/code-snapshots/svn/o/op/open-cobol/contrib/open-cobol-contrib-175-trunk.zip
unzip open-cobol-contrib*.zip
rm open-cobol-contrib*.zip
cd open-cobol-contrib*/tools/cobolmac
source comp-cobolmac.sh
sudo cp cobolmac /usr/bin/

