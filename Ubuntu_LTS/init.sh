## Update
sudo apt update && upgrade -y
sudo apt autoremove -y

## Settings
timedatectl set-timezone Europe/London
sudo apt install htpdate -y

## Argon One Util
curl https://download.argon40.com/argon1.sh | bash

## Install GUI
sudo apt install ubuntu-budgie-desktop -y

## Install Software
sudo apt install xrdp -y
sudo apt install blender -y
sudo apt install arduino -y


## Install Qt5
sudo apt install qtcreator qt5-default -y


## Install ROS
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
curl -sSL 'http://keyserver.ubuntu.com/pks/lookup?op=get&search=0xC1CF6E31E6BADE8868B172B4F42ED6FBAB17C654' | sudo apt-key add -
sudo apt update

sudo apt install ros-noetic-desktop-full -y


## Install Intel RealSense
wget https://github.com/IntelRealSense/librealsense/raw/master/scripts/libuvc_installation.sh
chmod +x ./libuvc_installation.sh
./libuvc_installation.sh
sudo rm -r -f libuvc_installation.sh

## Environment setup
#echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc
#source ~/.bashrc
