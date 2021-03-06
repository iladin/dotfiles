#!/bin/bash
#TODO: sudo check
grep "en_US.UTF-8" <(locale -a) || sudo locale-gen "en_US.UTF-8"
localectl set-locale LANG=en_US.UTF-8
test -d $HOME/fonts || \
git clone https://github.com/gabrielelana/awesome-terminal-fonts.git $HOME/fonts && \
cd $HOME/fonts && \
./build.sh && ./install.sh && cd -
# Set source and target directories
powerline_fonts_dir="${HOME}/.fonts"

# Accept a font / directory name, to avoid installing all fonts
if [ ! -z "$1" ];
then
  # Ensure thar directory exists, and offer suggestions if not

  if [[ ! -d "$powerline_fonts_dir/$1" ]];
  then
    echo -e "That font directory doesn't exist. Options are: \n"
    ls "$powerline_fonts_dir"
    exit -1
  fi

  powerline_fonts_dir="$powerline_fonts_dir/$1"
fi

find_command="find \"$powerline_fonts_dir\" \( -name '*.[o,t]tf' -or -name '*.pcf.gz' \) -type f -print0"

if [[ $(uname) == 'Darwin' ]]; then
  # MacOS
  font_dir="$HOME/Library/Fonts"
else
  # Linux
  font_dir="$HOME/.local/share/fonts"
  mkdir -p "$font_dir"
fi

# Copy all fonts to user fonts directory
eval "$find_command" | xargs -0 -I % cp "%" "$font_dir/"
mkdir /tmp/adodefont
cd /tmp/adodefont
wget https://github.com/adobe-fonts/source-code-pro/archive/1.017R.zip
unzip 1.017R.zip 
mkdir -p ~/.fonts
cp source-code-pro-1.017R/OTF/*.otf ~/.fonts/
rm -rf /tmp/adobefont
# Reset font cache on Linux
if [[ -n $(which fc-cache) ]]; then
  fc-cache -f -v "$font_dir"
fi

if [ ! -z "$1" ];
then
  echo "$1 font installed to $font_dir"
else
  echo "All fonts installed to $font_dir"
fi
