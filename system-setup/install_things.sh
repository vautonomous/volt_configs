#!/bin/bash

USER_NAME=$1

# Use https://regolith-desktop.com/ for i3-gaps

wget -qO - https://regolith-desktop.org/regolith.key | \
gpg --dearmor | sudo tee /usr/share/keyrings/regolith-archive-keyring.gpg > /dev/null

echo deb "[arch=amd64 signed-by=/usr/share/keyrings/regolith-archive-keyring.gpg] \
https://regolith-desktop.org/release-ubuntu-jammy-amd64 jammy main" | \
sudo tee /etc/apt/sources.list.d/regolith.list

apt update
apt dist-upgrade -y

apt install -y fzf \
ccache \
suckless-tools \
j4-dmenu-desktop \
rofi \
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
thunar-archive-plugin \
gnome-screenshot \
autoconf \
snapd \
gnome-flashback \
ilia \
xfce4-settings \
net-tools \
mate-terminal \
nethogs \
smartmontools \
flatpak


# Set default directories

gsettings set org.gnome.gnome-screenshot auto-save-directory "~/Pictures/screenshots"

sudo -u $USER_NAME mkdir /home/$USER_NAME/programs
sudo -u $USER_NAME mkdir /home/$USER_NAME/projects

# Trashy

cd /home/$USER_NAME/programs
sudo -u $USER_NAME git clone https://gitlab.com/trashy/trashy.git
cd trashy
autoreconf --install
automake
./configure
sudo -u $USER_NAME make
make install
cd /home/$USER_NAME/
sudo -u $USER_NAME rm -rf /home/$USER_NAME/programs/trashy

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
cd /home/$USER_NAME/programs/i3blocks-contrib
sudo -u $USER_NAME make
cd /home/$USER_NAME/

# Remove i386 architecture and install drivers
sudo dpkg --remove-architecture i386

sudo ubuntu-drivers autoinstall

# i3 config
sudo -u $USER_NAME cp -r /home/$USER_NAME/volt_configs/i3-config/i3 /home/$USER_NAME/.config

# Chrome
sudo -u $USER_NAME wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
gdebi -n google-chrome-stable_current_amd64.deb
sudo -u $USER_NAME rm google-chrome-stable_current_amd64.deb

# Others

sudo snap install core

sudo snap install gitkraken --classic
sudo snap install discord
sudo snap install code --classic

sudo snap install clion --classic

# OBS Studio
sudo add-apt-repository ppa:obsproject/obs-studio
sudo apt install ffmpeg obs-studio

# FSearch
sudo add-apt-repository -y ppa:christian-boxdoerfer/fsearch-daily
sudo apt install -y fsearch

# configure ccache

ccache -c
echo "max_size = 100G" > /home/$USER_NAME/.cache/ccache/ccache.conf

# Create symbolic links

chmod +x ./home/$USER_NAME/volt_configs/install_links.sh
./home/$USER_NAME/volt_configs/install_links.sh

apt autoremove

# .bashrc things
sudo -u $USER_NAME sed -i 's/#force_color_prompt=yes/force_color_prompt=yes/g' .bashrc

# flatpak config
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

