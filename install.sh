mkdir ~/.alttmp
cd ~/.alttmp

sudo pacman -Syu
sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay && makepkg -si
cd ~/.alttmp

sudo pacman -Sy - < packages-pacman.txt
sudo yay -Sy - < packages-yay.txt

yes | cp -r -f .config/* ~/.config/

cd ~/
rm -rf ~/.alttmp