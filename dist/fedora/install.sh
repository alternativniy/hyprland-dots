SCRIPTPATH=`pwd`

sudo dnf update -y

sudo dnf -y install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf -y install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf -y copr enable atim/starship
sudo dnf -y copr enable erikreider/SwayNotificationCenter
sudo dnf copr enable sneexy/zen-browser
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/vscode.repo > /dev/null

sudo dnf check-update
sudo dnf -y install $(<./packages.txt)



mkdir -p ~/.local/share/fonts

if [ ! -e "~/.local/share/fonts/SymbolsNerdFont-Regular.ttf" ]
then
  cd ~/.local/share/fonts && curl -fLO https://github.com/ryanoasis/nerd-fonts/raw/HEAD/patched-fonts/NerdFontsSymbolsOnly/SymbolsNerdFont-Regular.ttf
  cd $SCRIPTPATH
fi