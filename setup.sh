rm -rf ~/.config
rm -rf ~/.e
rm -rf ~/.elementary
rm -rf ~/.ssh
ln -sf ~/dotfiles/.config ~/.config
ln -sf ~/dotfiles/.e ~/.e
ln -sf ~/dotfiles/.elementary ~/.elementary
ln -sf ~/dotfiles/.ssh ~/.ssh

rm ~/.bashrc
rm ~/.bash_profile
rm ~/.bash_logout
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
