set -xv
git clone git://git.code.sf.net/p/zsh/code zsh

export CHROOT=$HOME
cd zsh

autoconf

# Options from Ubuntu Zsh package rules file (http://launchpad.net/ubuntu/+source/zsh)
./configure --prefix=$CHROOT \
            --mandir=$CHROOT/man \
            --bindir=$CHROOT/bin \
            --infodir=$CHROOT/usr/share/info \
            --enable-maildir-support \
            --enable-etcdir=$CHROOT/etc/zsh \
            --enable-function-subdirs \
            --enable-site-fndir=$CHROOT/usr/local/share/zsh/site-functions \
            --enable-fndir=$CHROOT/usr/share/zsh/functions \
            --with-tcsetpgrp \
            --with-term-lib="ncursesw" \
            --enable-cap \
            --enable-pcre \
            --enable-readnullcmd=pager \
            LDFLAGS="-Wl,--as-needed -g"

make

make check

make install
