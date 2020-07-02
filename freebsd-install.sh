#!/bin/sh
# TODO Create user christian using the pw utility

# -------- CREATE MY USER------------- 

#-------------------------------------
PACKAGES="xorg nvidia-driver zathura zathura-pdf-mupdf emacs nvim iridium-browser R python37 mpv newsboat libreoffice htop doas cups"

echo INSTALL SCRIPT FOR MY PC

if [ `uname` != "FreeBSD" ]; then
	echo "Not a FreeBSD system"
	exit 1
elif [ `id -u` -ne 0 ]; then
	echo "You must be root to use this script"
	exit 1
fi

# Edit login.conf to make umlauts available in the terminal

echo -e '\ngerman|German Users Accounts:\' >> /etc/login.conf
echo '	:charset=UTF-8:\' >> /etc/login.conf
echo '	:lang=de_DE.UTF-8:\' >> /etc/login.conf
echo '	:tc=default:' >> /etc/login.conf
cap_mkdb /etc/login.conf

if [ `which git` ]; then
	echo "Cloning dotfile repository from github"
	git clone http://github.com/cfuchs90/dotfiles
else
	echo Git not found, installing git
	pkg install git
	echo "Cloning dotfile repository from github"
	git clone http://github.com/cfuchs90/dotfiles
fi

#if [ -e ~/dotfiles/freebsd/freebsd_packages ]; then
	#FILELIST=`awk '{print $1}' ~/dotfiles/freebsd/freebsd_packages`
	#for package in $FILELIST; do
		#pkg install -y $package
	#done
#else
	#echo "Package file does not exist, using PACKGES Variable instead"
	#for package in $PACKAGES; do
		#pkg install -y $package
	#done
#fi

echo "Which window manager would you like to install?"
echo "1. I3"
echo "2. I3-gaps"
echo "3. awesome"
read -p "Please enter the number for the corresponding window manager: " wmchoice

case $wmchoice in
	1)
		echo "Installing i3"
		pkg install i3
		;;
	2)
		echo "Installing i3-gaps"
		pkg install i3-gaps
		;;
	3)
		echo "Installing awesome window manager"
		pkg install awesome
		mkdir -p /home/christian/.config/awesome
		cp ~/dotfiles/awesome/rc.lua /home/christian/.config/awesome/rc.lua
		;;
	*)
		echo "Ok Bye"
		;;
esac

cat ~/dotfiles/freebsd/sysctl.conf > /etc/sysctl.conf

cp ~/dotfiles/freebsd/doas.conf /usr/local/etc/doas.conf

cp ~/dotfiles/nvidia-driver.conf /usr/local/etc/X11/xorg.conf.d/

sed -n '4p' ~/dotfiles/fstab >> /etc/fstab

cp -R ~/dotfiles/X /home/christian/.config

cp ~/dotfiles/X/xinitrc /home/christian/.xinitrc

sysrc kld_list+="nvidia-modeset"
sysrc cupsd_enable="YES"


