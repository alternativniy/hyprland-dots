#!/bin/bash

SCRIPTPATH=`pwd`

mkdir ~/.alttmp
cd ~/.alttmp

yes | sudo pacman -Syu

if ! command -v yay 2>&1 >/dev/null
then
    sudo pacman -S --needed git base-devel
    git clone https://aur.archlinux.org/yay.git
    cd yay && makepkg -si
fi    

cd $SCRIPTPATH

yes | sudo pacman -Sy - < ./packages-pacman.txt
yes | yay -Sy - < ./packages-yay.txt

sudo systemctl enable libvirtd.service

yes | cp -r -f ./.config/* ~/.config/

sudo chown -R $(whoami) /opt/visual-studio-code/

rm -rf ~/.alttmp
