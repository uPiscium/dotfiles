rm -rf ~/.bashrc
rm -rf ~/.bash_profile
rm -rf ~/.bash_logout

ln -sf ~/dotfiles/.config ~/.config
ln -sf ~/dotfiles/.xprofile ~/.xprofile
ln -sf ~/dotfiles/.xmodmap ~/.xmodmap
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.zshrc.local ~/.zshrc.local
ln -sf ~/dotfiles/.fehbg ~/.fehbg

sudo cp ~/dotfiles/pacman.conf /etc/pacman.conf

sudo pacman -S --noconfirm git go

cd ~/
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ~/
rm -rf yay
yay -Syu

mkdir Documents
mkdir Downloads
mkdir Musics

cd ~/dotfiles
cat ./packages.list | yay -S --noconfirm -

sudo systemctl enable lightdm
sudo systemctl enable acpid
sudo systemctl enable bluetooth

git config --global init.defaultBranch main
git config --global credential.helper store
git config --global user.email "upiscium@gmail.com"
git config --global user.name "uPiscium"
