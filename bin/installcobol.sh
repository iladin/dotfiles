#!/usr/bin/env bash
set -xe
cob_version=${1:-3.1.2}
cob_url=https://versaweb.dl.sourceforge.net/project/gnucobol/gnucobol # Sourceforge changes this
curl_flags="--show-error --location --insecure"
if hash apt; then
  sudo apt update
  sudo apt install -y build-essential autoconf libgmp-dev libdb-dev
elif hash yum; then
  sudo yum makecache
  sudo yum install gmp-devel.x86_64 libdb-devel.x86_64
fi
sudo ldconfig # Runs so configure can see gcc
cd "${TMPDIR:=/tmp}"
curl ${curl_flags} "${cob_url}/${cob_version%.*}/gnucobol-${cob_version}.tar.gz" --output gnucobol-"${cob_version}".tar.gz 
tar xfv gnucobol-"${cob_version}".tar.gz
cd gnucobol-"$cob_version"
./configure --prefix=/
make
sudo make install # Install needs to run as root
sudo ldconfig # Run again to update ld.so.cache
cd ..
rm -rf gnucobol-"$cob_version"
