sudo mv /etc/X11/xorg.conf.d/10-nvidia-drm-outputclass.conf /etc/X11/xorg.conf.d/10-nvidia-drm-outputclass.conf.bak
sudo mv /etc/lightdm/lightdm.conf /etc/lightdm/lightdm.conf.tmp
sudo mv /etc/lightdm/lightdm.conf.bak /etc/lightdm/lightdm.conf
sudo mv /etc/lightdm/lightdm.conf.tmp /etc/lightdm/lightdm.conf.bak

echo -ne "\033[1;32mRestart for applying? (Y/n)\033[0m";
read answer;
if [ "$answer" = "n" ]; then
  echo "Restart your system to apply changes.";
else
  reboot
fi
