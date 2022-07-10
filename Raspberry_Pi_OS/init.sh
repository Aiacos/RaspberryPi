## Update
cd $home
sudo apt update
sudo apt upgrade -y
sudo apt autoremove -y


## Argon One Util
curl https://download.argon40.com/argon1.sh | bash

## Tp-Link AC600 
sudo wget http://downloads.fars-robotics.net/wifi-drivers/install-wifi -O /usr/bin/install-wifi
sudo chmod +x /usr/bin/install-wifi
sudo install-wifi

## Install Software
sudo apt install xrdp -y
sudo apt install xscreensaver -y
sudo apt install blender -y
sudo apt install arduino -y
wget -qO- https://get.speedify.com | sudo -E bash -
sudo apt install network-manager -y


## Instal Qt5
sudo apt install qtcreator qt5-default -y

## Install VSCODE
wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg | gpg --dearmor | sudo dd of=/etc/apt/trusted.gpg.d/vscodium.gpg
echo 'deb https://paulcarroty.gitlab.io/vscodium-deb-rpm-repo/debs/ vscodium main' | sudo tee --append /etc/apt/sources.list.d/vscodium.list
sudo apt update && sudo apt install codium -y


## Install ROS NOETIC
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu buster main" > /etc/apt/sources.list.d/ros-noetic.list'
sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
sudo apt update

# dependencies
sudo apt-get install -y python-rosdep python-rosinstall-generator python-wstool python-rosinstall cmake
sudo apt-get install -y python3-rosdep python3-rosinstall-generator python3-vcstool build-essential

sudo rosdep init
rosdep update

mkdir ~/ros_catkin_ws
cd ~/ros_catkin_ws

# ROS-Comm
#rosinstall_generator ros_comm --rosdistro noetic --deps --wet-only --tar > noetic-ros_comm-wet.rosinstall
#wstool init src noetic-ros_comm-wet.rosinstall

# Desktop
rosinstall_generator desktop --rosdistro noetic --deps --wet-only --tar > noetic-desktop-wet.rosinstall
wstool init -j8 src noetic-desktop-wet.rosinstall

# Desktop_Full
#rosinstall_generator desktop_full --rosdistro noetic --deps --tar > noetic-desktop_full-wet.rosinstall
#wstool init -j8 src noetic-desktop_full-wet.rosinstall

rosdep install -y --from-paths src --ignore-packages-from-source --rosdistro noetic -r --os=debian:buster

# compile
sudo src/catkin/bin/catkin_make_isolated --install -DCMAKE_BUILD_TYPE=Release --install-space /opt/ros/noetic -j1 -DPYTHON_EXECUTABLE=/usr/bin/python3


## Intel RealSense
cd $home
wget https://github.com/IntelRealSense/librealsense/raw/master/scripts/libuvc_installation.sh
chmod +x ./libuvc_installation.sh
./libuvc_installation.sh

# Wait until Librealsense script completed message is displayed (may take some time)
# Connect RealSense device
# Run 'rs-enumerate-devices' from the terminal to verify the installation

# Installing ROS Package: realsense-ros
cd $home
bash RaspberryPi/build/ros-realsense.sh


## Install Arduino Lib
cd $home
bash RaspberryPi/build/ros-serial-arduino.sh


## CleanUp
cd $home
sudo rm -r -f libuvc_installation.sh
sudo rm -r -f librealsense_build
sudo apt autoremove -y


## Environment setup
echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc
echo "source ~/catkin_ws/devel/setup.bash" >> ~/.bashrc
source ~/.bashrc


## Test

# test ROS
#source /opt/ros/noetic/setup.bash
#roscd
#roscore

# test RealSense
#/opt/realsense/bin/realsense-viewer
#roslaunch realsense2_camera rs_camera.launch
