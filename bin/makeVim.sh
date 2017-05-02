 apt update && apt install -y libncurses5-dev libgnome2-dev libgnomeui-dev \
    libgtk2.0-dev libatk1.0-dev libbonoboui2-dev \
    libcairo2-dev tcl-dev libx11-dev libxpm-dev libxt-dev python-dev \
    python3-dev ruby-dev lua5.1 lua5.1-dev libperl-dev git libluajit-5.1-dev luajit


git clone --depth 1 https://github.com/vim/vim.git

cd vim

./configure \
--with-features=huge \
--enable-multibyte \
--enable-gui=gtk2 \
--enable-rubyinterp \
--enable-perlinterp \
--enable-tclinterp \
--enable-pythoninterp \
--enable-python3interp \
--enable-luainterp=dynamic \
--with-luajit \
--enable-gpm \
--enable-cscope \
--enable-fontset \
--enable-xim \
--enable-fail-if-missing || exit 1


 make install
