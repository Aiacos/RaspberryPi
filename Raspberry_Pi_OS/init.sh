## Update
cd $home
sudo apt update -y
sudo apt upgrade -y
sudo apt autoremove -y


## Argon One Util
curl https://download.argon40.com/argon1.sh | bash

## Pi-App util
wget -qO- https://raw.githubusercontent.com/Botspot/pi-apps/master/install | bash

## Tp-Link AC600 
#sudo wget http://downloads.fars-robotics.net/wifi-drivers/install-wifi -O /usr/bin/install-wifi
#sudo chmod +x /usr/bin/install-wifi
#sudo install-wifi

sudo apt install git -y
sudo apt install dkms -y
git clone https://github.com/aircrack-ng/rtl8812au.git
cd rtl8812au
sed -i 's/CONFIG_PLATFORM_I386_PC = y/CONFIG_PLATFORM_I386_PC = n/g' Makefile
sed -i 's/CONFIG_PLATFORM_ARM_RPI = n/CONFIG_PLATFORM_ARM_RPI = y/g' Makefile
sudo make dkms_install

## Install Software
sudo apt install xrdp -y
sudo apt install xscreensaver -y
sudo apt install blender -y
sudo apt install arduino -y
sudo apt install network-manager -y
sudo apt install usbmuxd -y

# Speedify
wget -qO- https://get.speedify.com | sudo -E bash -
/usr/share/speedify/speedify_cli login uni.lorenzo.a@gmail.com CaccaSecca86
/usr/share/speedify/speedify_cli startupconnect on

mkdir -p ~/.config/autostart/ && cp /usr/share/speedifyui/speedifyui-autostart.desktop ~/.config/autostart/

sudo sed -i 's/ENABLE_SHARE=0/ENABLE_SHARE=1/g' /etc/speedify/speedify.conf
sudo sed -i 's/SHARE_INTERFACE=""/SHARE_INTERFACE="wlan1"/g' /etc/speedify/speedify.conf
sudo sed -i 's/#WIFI_INTERFACE="wlan0"/WIFI_INTERFACE="wlan1"/g' /etc/speedify/speedify.conf
sudo sed -i 's/#WIFI_PASSWORD="password"/WIFI_PASSWORD="CaccaSecca86"/g' /etc/speedify/speedify.conf
sudo sed -i 's/#WIFI_MODE="2.4"/WIFI_MODE="5"/g' /etc/speedify/speedify.conf

# Parsec
wget https://s3.amazonaws.com/parsec-build/package/parsec-rpi.deb
sudo dpkg -i parsec-rpi.deb


## Instal Qt5
sudo apt install qtcreator qtbase5-dev qtchooser qt5-qmake qtbase5-dev-tools -y

## Install VSCODE
wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg | gpg --dearmor | sudo dd of=/etc/apt/trusted.gpg.d/vscodium.gpg
echo 'deb https://paulcarroty.gitlab.io/vscodium-deb-rpm-repo/debs/ vscodium main' | sudo tee --append /etc/apt/sources.list.d/vscodium.list
sudo apt update && sudo apt install codium -y
