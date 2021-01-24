## Update
cd
sudo apt update && upgrade -y
sudo apt autoremove -y


## Argon One Util
curl https://download.argon40.com/argon1.sh | bash


## Install Gnome Tweak Tool
sudo add-apt-repository universe
sudo apt install gnome-tweak-tool -y
sudo apt install gir1.2-gtop-2.0 gir1.2-nm-1.0 gir1.2-clutter-1.0 -y


## Install Software
sudo apt install openssh-server sshguard -y
sudo apt install xrdp -y
sudo apt install blender -y
sudo apt install arduino -y
sudo apt install geany -y


## Install Qt5
sudo apt install qtcreator qt5-default -y

## Install VSCODE
wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg | gpg --dearmor | sudo dd of=/etc/apt/trusted.gpg.d/vscodium.gpg
echo 'deb https://paulcarroty.gitlab.io/vscodium-deb-rpm-repo/debs/ vscodium main' | sudo tee --append /etc/apt/sources.list.d/vscodium.list
sudo apt update && sudo apt install codium -y


## Install ROS
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
curl -sSL 'http://keyserver.ubuntu.com/pks/lookup?op=get&search=0xC1CF6E31E6BADE8868B172B4F42ED6FBAB17C654' | sudo apt-key add -
sudo apt update -y

# ROS
sudo apt install ros-noetic-desktop-full -y


## Install Intel RealSense
cd
wget https://github.com/IntelRealSense/librealsense/raw/master/scripts/libuvc_installation.sh
chmod +x ./libuvc_installation.sh
./libuvc_installation.sh

# Wait until Librealsense script completed message is displayed (may take some time)
# Connect RealSense device
# Run 'rs-enumerate-devices' from the terminal to verify the installation

# Installing ROS Package: realsense-ros
# source ROS
source /opt/ros/noetic/setup.bash

#mkdir -p ~/catkin_ws/src
cd ~/catkin_ws/src/
mv * ~/catkin_ws/src/realsense/
cd ~/catkin_ws/src/
git clone https://github.com/IntelRealSense/realsense-ros.git
cd realsense-ros/
git checkout 'git tag | sort -V | grep -P "^\d+\.\d+\.\d+" | tail -1'
cd ..
catkin_init_workspace
cd ..

cd src
git clone https://github.com/pal-robotics/ddynamic_reconfigure.git
cd ddynamic_reconfigure
git checkout 'git tag | sort -V | grep -P "^\d+\.\d+\.\d+" | tail -1'
cd ../..

catkin_make clean
catkin_make -DCATKIN_ENABLE_TESTING=False -DCMAKE_BUILD_TYPE=Release
catkin_make install


## CleanUp
cd
sudo rm -r -f libuvc_installation.sh
sudo rm -r -f librealsense_build
sudo apt autoremove -y


## Environment setup
echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc
echo "source ~/catkin_ws/devel/setup.bash" >> ~/.bashrc
source ~/.bashrc


# Dependencies for building packages
#sudo apt install python3-rosdep python3-rosinstall python3-rosinstall-generator python3-wstool build-essential -y
#sudo apt install python3-rosdep -y

#sudo rosdep init
#rosdep update


## Test

# test ROS
#source /opt/ros/noetic/setup.bash
#roscd
#roscore

# test RealSense
#/opt/realsense/bin/realsense-viewer
#roslaunch realsense2_camera rs_camera.launch
