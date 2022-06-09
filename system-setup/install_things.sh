#!/bin/bash

USER_NAME=$1

apt update
apt dist-upgrade -y

add-apt-repository -y ppa:kgilmer/speed-ricer

apt install -y \
suckless-tools \
j4-dmenu-desktop \
i3-gaps \
i3blocks \
xdotool \
numlockx \
ranger \
nitrogen \
gedit \
htop \
tree \
gdebi \
hexchat \
gimp \
git \
git-lfs \
cmake-curses-gui \
fonts-font-awesome \
arandr \
libpcre3-dev \
meson \
thunar \
lxappearance \
numix-gtk-theme \
numix-icon-theme \
libgtk-3-dev \
qdirstat \
screenfetch \
lm-sensors \
net-tools \
mate-terminal \

sudo -u $USER_NAME mkdir /home/$USER_NAME/programs
sudo -u $USER_NAME mkdir /home/$USER_NAME/projects

# Dunst

apt install -y libdbus-1-dev libx11-dev libxinerama-dev libxrandr-dev libxss-dev libglib2.0-dev libpango1.0-dev libgtk-3-dev libxdg-basedir-dev libnotify-dev

cd /home/$USER_NAME/programs
sudo -u $USER_NAME git clone https://github.com/dunst-project/dunst.git
cd dunst
sudo -u $USER_NAME make
make install
cd /home/$USER_NAME/
sudo -u $USER_NAME rm -rf /home/$USER_NAME/programs/dunst

# i3blocks

cd /home/$USER_NAME/programs
sudo -u $USER_NAME git clone https://github.com/vivien/i3blocks-contrib.git
sudo -u $USER_NAME cp /home/$USER_NAME/volt_configs/i3-config/.i3blocks.conf /home/$USER_NAME/
cd /home/$USER_NAME/programs/i3blocks-contrib
sudo -u $USER_NAME make
cd /home/$USER_NAME/

# i3 config
sudo -u $USER_NAME cp -r /home/$USER_NAME/volt_configs/i3-config/i3 /home/$USER_NAME/.config

# Chrome
sudo -u $USER_NAME wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
gdebi -n google-chrome-stable_current_amd64.deb
sudo -u $USER_NAME rm google-chrome-stable_current_amd64.deb

# CLion

cd /home/$USER_NAME/programs
sudo -u $USER_NAME wget https://download.jetbrains.com/cpp/CLion-2022.1.2.tar.gz
sudo -u $USER_NAME tar -xf CLion-2022.1.2.tar.gz
sudo -u $USER_NAME mv clion-2022.1.2 clion
sudo -u $USER_NAME chmod +x clion/bin/clion.sh
sudo -u $USER_NAME rm CLion-2022.1.2.tar.gz
cd /home/$USER_NAME/

apt autoremove

# .bashrc things
sudo -u $USER_NAME sed -i 's/#force_color_prompt=yes/force_color_prompt=yes/g' .bashrc

