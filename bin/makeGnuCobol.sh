#!/usr/bin/env bash
#TODO: ERROR CHECKING JEEZ
sudo apt-get update
sudo apt-get -yqq install help2man texinfo libdb5.3-dev flex libgmp3-dev libncurses5-dev
mkdir ~/tmp 2> /dev/null
cd ~/tmp
#rm -rf opensource-cobol
#git clone https://github.com/opensourcecobol/opensource-cobol.git
#cd opensource-cobol/vbisam
#chmod a+x configure
#./configure
#make cycle
#sudo make install
#sudo ldconfig
cd ~/tmp
test -d gnucobol && rm -rf gnucobol
git clone https://gitlab.com/gnu/cobol.git
cd cobol
#./configure --with-vbisam
./configure --with-db
make || exit 1
make check
sudo make install || exit 1
sudo ldconfig
cd ~/tmp
test -d open-cobol-contrib && rm -rf open-cobol-contrib
git clone https://gitlab.com/iladin/open-cobol-contrib.git
cd open-cobol-contrib*/trunk/tools/cobolmac
source comp-cobolmac.sh
sudo cp cobolmac /usr/bin
