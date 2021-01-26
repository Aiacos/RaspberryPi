## Update
cd $home
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
cd $home
wget https://github.com/IntelRealSense/librealsense/raw/master/scripts/libuvc_installation.sh
chmod +x ./libuvc_installation.sh
./libuvc_installation.sh

# Wait until Librealsense script completed message is displayed (may take some time)
# Connect RealSense device
# Run 'rs-enumerate-devices' from the terminal to verify the installation

# Installing ROS Package: realsense-ros
cd $home
cd RaspberryPi/
bash build/ros-realsense.sh


## Install Arduino ROS Lib
sudo apt-get install ros-noetic-rosserial-arduino -y
sudo apt-get install ros-noetic-rosserial -y

mkdir -p ~/sketchbook/libraries
cd ~/sketchbook/libraries
rm -rf ros_lib
rosrun rosserial_arduino make_libraries.py ~/sketchbook/libraries


## CleanUp
cd $home
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
