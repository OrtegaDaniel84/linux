#!/bin/sh

# Install packages
sudo apt install -y --no-install-recommends \
  xorg openbox obconf polybar librsvg2-common \
  rofi papirus-icon-theme alacritty x11vnc novnc websockify \
  fonts-dejavu-core curl xvfb python3-xdg \
  network-manager-gnome vim feh wmctrl dbus-x11 \
  lightdm lightdm-gtk-greeter 

mkdir -p .config/
cp -r configs/.config/* .config/
chmod +x .config/openbox/autostart 
chmod +x .config/polybar/polywins.sh

mkdir -p /home/$USER/Pictures
cp configs/bg.jpg Pictures/

sudo cp configs/novnc/index.html /usr/share/novnc/index.html
sudo cp configs/.config/interfaces /etc/network/interfaces

sudo cp configs/novnc/openbox-novnc.service /etc/systemd/system/openbox-novnc.service
sudo sed -i "s/daniel/$USER/g" /etc/systemd/system/openbox-novnc.service

sudo mkdir -p /etc/polkit-1/rules.d/
sudo cp configs/.config/50-networkmanager.rules /etc/polkit-1/rules.d/50-networkmanager.rules
sudo sed -i 's/managed=false/managed=true/' /etc/NetworkManager/NetworkManager.conf
sudo usermod -aG netdev $USER

sudo systemctl daemon-reload
sudo systemctl enable lightdm
sudo systemctl enable NetworkManager
sudo systemctl enable openbox-novnc.service

sh install_apps.sh
reboot reboot


