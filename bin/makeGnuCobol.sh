#!/usr/bin/env bash
#TODO: ERROR CHECKING JEEZ

if [[ $EUID > 0  ]]; then
    echo "Please run as root/sudo"
    exit 1
fi
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib
function installgmp32(){
    rm -f gmp-6.1.2.tar.bz2
    wget https://ftp.gnu.org/gnu/gmp/gmp-6.1.2.tar.bz2
    tar -xvf gmp-6.1.2.tar.bz2
    cd gmp-6.1.2
    ABI=32 ./configure --prefix=/usr --enable-cxx --libdir=/usr/lib32 CC="gcc -m32" CXX="g++ -m32" && \
    make &&\
    make install
}
function installCobolmac() {
	 ldconfig
		cd ~/tmp
		test -d open-cobol-contrib && rm -rf open-cobol-contrib
		git clone https://gitlab.com/iladin/open-cobol-contrib.git
		cd open-cobol-contrib/tools/cobolmac
		source comp-cobolmac.sh
		 cp cobolmac /usr/bin
 }
function installVBIsam(){
	rm -rf opensource-cobol
	git clone https://github.com/opensourcecobol/opensource-cobol.git
    cd opensource-cobol/vbisam
    chmod a+x configure
    ./configure CPPFLAGS="-I/usr/include -L/usr/lib32" --build=i686-linux-gnu --host=i686-linux-gnu  "CFLAGS=-m32" "LDFLAGS=-m32" "CXXFLAGS=-m32" || exit 1
    make cycle
	make install
	ldconfig
	cd ~/tmp
}
export COB_CFLAGS=-m32
 apt update
 #apt -yqq install help2man texinfo libdb5.3-dev flex libgmp3-dev:i386 libncurses5-dev:i386 bison gcc-multilib:i386 g++-multilib:i386
  apt -y install help2man texinfo flex libgmp3-dev libncurses5-dev bison gcc-multilib g++-multilib

mkdir ~/tmp 2> /dev/null
cd ~/tmp


installVBIsam
installgmp32
cd ~/tmp
test -d cobol && rm -rf cobol
git clone https://gitlab.com/iladin/cobol.git
cd cobol
#./configure --with-vbisam
COB_CFLAGS=-m32 ./configure --with-vbisam CPPFLAGS="-I/usr/include -L/usr/lib32" --build=i686-linux-gnu --host=i686-linux-gnu  "CFLAGS=-m32" "LDFLAGS=-m32" "CXXFLAGS=-m32" || exit 1
make || exit 1
make check
make install || exit 1
installCobolmac
