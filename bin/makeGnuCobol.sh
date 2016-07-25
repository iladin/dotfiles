#!/usr/bin/env bash
#TODO: ERROR CHECKING JEEZ
mkdir ~/tmp 2> /dev/null
cd ~/tmp
rm -rf open-cobol*
wget https://sourceforge.net/code-snapshots/svn/o/op/open-cobol/code/open-cobol-code-1006-branches-gnu-cobol-2.0-debugger.zip
unzip open-cobol-code*.zip
cd open-cobol-code*
sudo apt-get install libdb-dev
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

