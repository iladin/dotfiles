#!/usr/bin/env bash
mkdir ~/tmp 2> /dev/null
cd ~/tmp
wget https://sourceforge.net/code-snapshots/svn/o/op/open-cobol/code/open-cobol-code-999-trunk.zip
unzip open-cobol-code-999-trunk.zip
cd open-cobol-code-999-trunk/gnu-cobol
sudo apt-get install libdb-dev
./configure
make
sudo make install

