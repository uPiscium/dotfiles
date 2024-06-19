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

sudo rm /etc/pacman.conf
ln -sf ~/dotfiles/pacman.conf /etc/pacman.conf

cat ./inits.list | sudo pacman -S --noconfirm -
