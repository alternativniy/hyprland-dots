mkdir ~/.alttmp
cd ~/.alttmp

yes | sudo pacman -Syu

if ! command -v yay 2>&1 >/dev/null
then
    sudo pacman -S --needed git base-devel
    git clone https://aur.archlinux.org/yay.git
    cd yay && makepkg -si
    cd ~/.alttmp
fi    

yes | sudo pacman -Sy - < ./packages-pacman.txt
yes | sudo yay -Sy - < ./packages-yay.txt

yes | cp -r -f .config/* ~/.config/

cd ~/
rm -rf ~/.alttmp