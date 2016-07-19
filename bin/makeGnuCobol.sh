#!/usr/bin/env bash
#TODO: ERROR CHECKING JEEZ
mkdir ~/tmp 2> /dev/null
cd ~/tmp
rm -rf open-cobol*
wget https://sourceforge.net/code-snapshots/svn/o/op/open-cobol/code/open-cobol-code-999-branches-gnu-cobol-2.0.zip
unzip open-cobol-code*.zip
cd open-cobol-code*/gnu-cobol
sudo apt-get install libdb-dev
./configure
make
sudo make install
cd ~/tmp
wget https://sourceforge.net/code-snapshots/svn/o/op/open-cobol/contrib/open-cobol-contrib-175
zip
unzip open-cobol-contrib-175-trunk.zip
cd open-cobol-contrib-175-trunk/tools/cobolmac
c

