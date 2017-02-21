#!/usr/bin/env bash
#TODO: ERROR CHECKING JEEZ


function installgmp32(){

    wget https://ftp.gnu.org/gnu/gmp/gmp-6.1.2.tar.bz2
    tar -xvf gmp-6.1.2.tar.bz2
    ABI=32 ./configure --prefix=/usr --enable-cxx --libdir=/usr/lib32 CC="gcc -m32" CXX="g++ -m32" && \
    make &&\
    sudo make install
}
export COB_CFLAGS=-m32
sudo apt-get update
sudo apt-get -yqq install help2man texinfo libdb5.3-dev flex libgmp3-dev libncurses5-dev bison gcc-multilib g++-multilib
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
installgmp32
test -d cobol && rm -rf cobol
git clone https://gitlab.com/gnu/cobol.git
cd cobol
#./configure --with-vbisam
COB_CFLAGS=-m32 ./configure CPPFLAGS="-I/usr/include" --with-db --build=i686-linux-gnu --host=i686-linux-gnu  "CFLAGS=-m32" "LDFLAGS=-m32" "CXXFLAGS=-m32" || exit 1
make || exit 1
make check
sudo make install || exit 1
sudo ldconfig
cd ~/tmp
test -d open-cobol-contrib && rm -rf open-cobol-contrib
git clone https://gitlab.com/iladin/open-cobol-contrib.git
cd open-cobol-contrib/tools/cobolmac
source comp-cobolmac.sh
sudo cp cobolmac /usr/bin
