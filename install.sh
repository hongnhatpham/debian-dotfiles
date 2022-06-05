#!/bin/bash

#Update & upgrade
sudo apt update && sudo apt upgrade -y

#Move config folder out 
cp -r ~/debian-dotfiles/config-files/ ~

#Ly Lock screen
#sudo apt install build-essential libpam0g-dev libxcb-xkb-dev -y

#cd ~
#git clone --recurse-submodules https://github.com/nullgemm/ly.git
#cd ly
#make
#sudo make run
#sudo make install
#sudo systemctl enable ly.service
#cd ~
#rm -r ~/ly

#Install Xorg display server
sudo apt install xorg xserver-xorg xutils mesa-utils xinit arandr autorandr -y

#Install firmwares
sudo apt install firmware-linux firmware-linux-nonfree -y

#Install terminal programs
sudo apt install neovim htop kitty neofetch vifm nodejs npm -y

#Install VIM config
sudo npm install -g yarn
cd ~/.config/nvim/plugged/coc.nvim
yarn install
yarn build

#Web development
sudo npm install -g live-server

#Install Flatpak
sudo apt install flatpak -y
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

#Install power management
cd ~
git clone https://github.com/AdnanHodzic/auto-cpufreq.git
cd auto-cpufreq && sudo ./auto-cpufreq-installer

sudo auto-cpufreq --install
cd ~

sudo apt install acpi -y

# Install Pipewire audio service
sudo apt install wireplumber pipewire-media-session- -y
systemctl --user --now enable wireplumber.service
sudo apt install pipewire-pulse pulsemixer -y

#Install fonts
sudo apt install ttf-mscorefonts-installer -y

#Install desktop environment
sudo apt install spectrwm dunst lxappearance xterm feh pcmanfm rofi -y

#Brave browser
sudo apt install apt-transport-https curl
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update
sudo apt install brave-browser -y

#Install other desktop programs
sudo apt install kdeconnect -y
sudo apt install mpv -y
sudo apt install zathura -y
