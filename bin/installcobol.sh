#!/usr/bin/env bash
set -xe
cob_version=${1:-3.1.2}
cob_url=https://versaweb.dl.sourceforge.net/project/gnucobol/gnucobol # Sourceforge changes this
curl_flags="--silent --show-error--location --insecure"
sudo apt install build-essential autoconf libgmp-dev libdb-dev
sudo ldconfig # Runs so configure can see gcc
cd "${TMPDIR:=/tmp}"
curl "${curl_flags}" "${cob_url}/${cob_version%.*}/gnucobol-${cob_version}.tar.gz"
tar xfv gnucobol-"${cob_version}".tar.gz
cd gnucobol-"$cob_version"
./configure --prefix=/
make
sudo make install # Install needs to run as root
sudo ldconfig # Run again to update ld.so.cache
cd ..
rm -rf gnucobol-"$cob_version"
