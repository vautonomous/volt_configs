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

sudo -u $USER_NAME mkdir /home/$USER_NAME/programs
sudo -u $USER_NAME mkdir /home/$USER_NAME/projects

# i3blocks

cd /home/$USER_NAME/programs
sudo -u $USER_NAME git clone https://github.com/vivien/i3blocks-contrib.git
sudo -u $USER_NAME cp /home/$USER_NAME/knowledge-base/pages/system-setup/.i3blocks.conf /home/$USER_NAME/
cd /home/$USER_NAME/programs/i3blocks-contrib
sudo -u $USER_NAME make
cd /home/$USER_NAME/

# i3 config
sudo -u $USER_NAME cp -r /home/$USER_NAME/knowledge-base/pages/system-setup/i3 /home/$USER_NAME/.config

# Chrome
sudo -u $USER_NAME wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
gdebi -n google-chrome-stable_current_amd64.deb
sudo -u $USER_NAME rm google-chrome-stable_current_amd64.deb

apt autoremove

# .bashrc things
sudo -u $USER_NAME sed -i 's/#force_color_prompt=yes/force_color_prompt=yes/g' .bashrc

