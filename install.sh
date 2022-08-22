#!/bin/bash

#Update & upgrade
sudo apt update && sudo apt upgrade -y

#Install Nala 
sudo apt install nala -y

#Move config folder out 
cp -r ~/debian-dotfiles/config-files/ ~

#Ly Lock screen
#sudo nala install build-essential libpam0g-dev libxcb-xkb-dev -y

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
sudo nala install xorg xserver-xorg xutils mesa-utils xinit arandr autorandr -y

#Install firmwares
sudo nala install firmware-linux firmware-linux-nonfree -y

#Install terminal programs
sudo nala install neovim htop kitty neofetch vifm nodejs npm -y

#Web development
sudo npm install -g live-server

#Install Flatpak
sudo nala install flatpak -y
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

#Install power management
cd ~
git clone https://github.com/AdnanHodzic/auto-cpufreq.git
cd auto-cpufreq && sudo ./auto-cpufreq-installer

sudo auto-cpufreq --install
cd ~

sudo nala install acpi -y

# Install Pipewire audio service
sudo nala install wireplumber pipewire-media-session- -y
systemctl --user --now enable wireplumber.service
sudo nala install pipewire-pulse pulsemixer -y

#Install fonts
sudo nala install ttf-mscorefonts-installer -y

#Install desktop environment
sudo nala install spectrwm dunst lxappearance xterm feh pcmanfm rofi -y

#Brave browser
sudo nala install nala-transport-https curl
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-nala-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-nala-release.s3.brave.com/ stable main"|sudo tee /etc/nala/sources.list.d/brave-browser-release.list
sudo nala update
sudo nala install brave-browser -y

#Install other desktop programs
sudo nala install kdeconnect -y
sudo nala install mpv -y
sudo nala install zathura -y
