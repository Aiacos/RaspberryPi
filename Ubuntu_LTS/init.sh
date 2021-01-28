## Update
cd $home
sudo apt update -y
sudo apt upgrade -y
sudo apt autoremove -y


## Argon One Util
curl https://download.argon40.com/argon1.sh | bash


## Install GUI Tools
bash desktopify.sh


## Install Software
sudo apt install openssh-server sshguard -y
sudo apt install xrdp -y
sudo apt install blender -y
sudo apt install arduino -y
sudo apt install geany -y
sudo apt install gitg -y


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


## Install PS3 Controller librarie
sudo apt-get install ros-noetic-joystick-drivers -y


## Install MoveIt
sudo apt install ros-noetic-moveit -y


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
bash RaspberryPi/build/ros-realsense.sh


## Install Arduino ROS Lib
sudo apt-get install ros-noetic-rosserial-arduino -y
sudo apt-get install ros-noetic-rosserial -y

cd $home
bash RaspberryPi/build/ros-serial-arduino.sh


## CleanUp
cd $home
sudo rm -r -f libuvc_installation.sh
sudo rm -r -f librealsense_build
sudo apt autoremove -y
sudo apt install gnome-software -y


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
