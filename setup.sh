#Install prerequisites
# apt update && apt upgrade -y
# apt install sudo git
# echo "<normal user> ALL=(ALL) NOPASSWD: ALL" | tee -a /etc/sudoers

# go to your normal user !!!!

# cd ~
# git clone https://github.com/OrtegaDaniel84/linux.git configs
# sh /configs/setup.sh
 
# Install packages

sudo apt install -y --no-install-recommends \
  xorg openbox obconf polybar librsvg2-common \
  rofi alacritty x11vnc novnc websockify \
  fonts-dejavu-core curl xvfb python3-xdg \
  network-manager-gnome vim feh wmctrl dbus-x11 lxpolkit \
  lightdm lightdm-gtk-greeter 

mkdir -p .config/
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


# Install Google 
#sudo apt install gpg
#sudo mkdir -p /usr/share/keyrings
#curl -fSsL https://dl.google.com/linux/linux_signing_key.pub | sudo gpg --dearmor | sudo tee /usr/share/keyrings/google-chrome.gpg > /dev/null
#curl -fsSL https://us-central1-apt.pkg.dev/doc/repo-signing-key.gpg | sudo gpg --dearmor --yes -o /usr/share/keyrings/antigravity-repo-key.gpg > /dev/null

#echo "deb [arch=amd64 signed-by=/usr/share/keyrings/google-chrome.gpg] http://dl.google.com/linux/chrome/deb/ stable main" | sudo tee /etc/apt/sources.list.d/google-chrome.list > /dev/null
#echo "deb [signed-by=/usr/share/keyrings/antigravity-repo-key.gpg] https://us-central1-apt.pkg.dev/projects/antigravity-auto-updater-dev/ antigravity-debian main" | sudo tee /etc/apt/sources.list.d/antigravity.list > /dev/null
#
#sudo apt update
#sudo apt install -y google-chrome-stable antigravity

