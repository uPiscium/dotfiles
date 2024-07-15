sudo cp ~/dotfiles/rogPacman.conf /etc/pacman.conf

sudo pacman-key --recv-keys 8F654886F17D497FEFE3DB448B15A6B0E9A3FA35
sudo pacman-key --finger 8F654886F17D497FEFE3DB448B15A6B0E9A3FA35
sudo pacman-key --lsign-key 8F654886F17D497FEFE3DB448B15A6B0E9A3FA35
sudo pacman-key --finger 8F654886F17D497FEFE3DB448B15A6B0E9A3FA35
sudo pacman -Syu

cat ./rog.list | sudo pacman -S --noconfirm -
cat ./rogyay.list | yay -S --noconfirm -

sudo systemctl enable --now power-profiles-daemon.service
sudo systemctl enable --now supergfxd
sudo systemctl enable --now switcheroo-control
