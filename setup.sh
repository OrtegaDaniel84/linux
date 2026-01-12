#Install prerequisites
# apt install sudo git
# echo "daniel  ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
# git clone https://github.com/OrtegaDaniel84/linux.git configs
# sh /configs/setup.sh

# Install packages
sudo apt install -y --no-install-recommends \
  xorg openbox obconf polybar rofi alacritty \
  x11vnc novnc websockify \
  fonts-dejavu-core curl xvfb python3-xdg \
  network-manager-gnome vim feh wmctrl \
  lightdm lightdm-gtk-greeter

cp -r configs/.config/* .config/
chmod +x .config/openbox/autostart 
chmod +x .config/polybar/polywins.sh

mkdir -p /home/$USER/Pictures
cp configs/bg.jpg Pictures/

sudo cp configs/novnc/index.html /usr/share/novnc/index.html
sudo cp configs/interfaces /etc/network/interfaces 
sudo cp configs/openbox-novnc.service /etc/systemd/system/openbox-novnc.service
sudo mkdir -p /etc/polkit-1/rules.d/
sudo cp configs/50-networkmanager.rules /etc/polkit-1/rules.d/50-networkmanager.rules

sudo sed -i 's/managed=false/managed=true/' /etc/NetworkManager/NetworkManager.conf

sudo usermod -aG netdev $USER

sudo systemctl daemon-reload
sudo systemctl enable lightdm
sudo systemctl enable NetworkManager
sudo systemctl enable openbox-novnc.service

#reboot reboot


# Install Google Chrome
# wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo tee /etc/apt/trusted.gpg.d/google.asc >/dev/null
# vi /etc/apt/sources.list << deb http://dl.google.com/linux/chrome/deb/ stable main
# sudo apt install google-chrome-stable

