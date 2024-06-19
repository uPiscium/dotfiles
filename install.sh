rm -rf ~/.config
rm -rf ~/.e
rm -rf ~/.elementary
rm -rf ~/.ssh
ln -sf ~/dotfiles/.config ~/.config
ln -sf ~/dotfiles/.e ~/.e
ln -sf ~/dotfiles/.elementary ~/.elementary
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

cat ./inits.list | sudo pacman -S --noconfirm -

sudo systemctl enable --now power-profiles-daemon.service
systemctl enable --now supergfxd
systemctl enable --now switcheroo-control
sudo grub-mkconfig -o /boot/grub/grub.cfg

cd ~/
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ~/
rm -rf yay

cat ./packages.list | yay -S --noconfirm -
