rm -rf ~/.config
rm -rf ~/.ssh
ln -sf ~/dotfiles/.config ~/.config
ln -sf ~/dotfiles/.ssh ~/.ssh

rm ~/.xprofile
rm ~/.zshrc
rm ~/.zshrc.local
ln -sf ~/dotfiles/.xprofile ~/.xprofile
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.zshrc.local ~/.zshrc.local

sudo cp ~/dotfiles/pacman.conf /etc/pacman.conf

sudo pacman-key --recv-keys 8F654886F17D497FEFE3DB448B15A6B0E9A3FA35
sudo pacman-key --finger 8F654886F17D497FEFE3DB448B15A6B0E9A3FA35
sudo pacman-key --lsign-key 8F654886F17D497FEFE3DB448B15A6B0E9A3FA35
sudo pacman-key --finger 8F654886F17D497FEFE3DB448B15A6B0E9A3FA35
sudo pacman -Syu

cat ./inits.list | sudo pacman -S --noconfirm -

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

sudo systemctl enable --now power-profiles-daemon.service
sudo systemctl enable --now supergfxd
sudo systemctl enable --now switcheroo-control
sudo systemctl enable lightdm
sudo systemctl enable acpid
sudo grub-mkconfig -o /boot/grub/grub.cfg

git config --global init.defaultBranch main
git config --global credential.helper store
git config --global user.email "upiscium@gmail.com"
git config --global user.name "uPiscium"
