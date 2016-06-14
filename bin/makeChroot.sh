export chroot=~/.chroot

mkdir $chroot
debootstrap stable $chroot http://httpredir.debian.org/debian/