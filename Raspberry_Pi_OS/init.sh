## Update
sudo apt update && upgrade -y
sudo apt autoremove -y

## Desktop Settings
sh desktop_settings.sh

## Argon One Util
curl https://download.argon40.com/argon1.sh | bash


## Install Software
sudo apt install xrdp -y
sudo apt install xscreensaver -y
sudo apt install blender -y
sudo apt install arduino -y


## Instal Qt5
sudo apt install qtcreator qt5-default -y


## Install ROS NOETIC
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu buster main" > /etc/apt/sources.list.d/ros-noetic.list'
sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
sudo apt update

# dependencies
sudo apt-get install -y python-rosdep python-rosinstall-generator python-wstool python-rosinstall build-essential cmake

sudo rosdep init
rosdep update

mkdir ~/ros_catkin_ws
cd ~/ros_catkin_ws

# ROS-Comm
#rosinstall_generator ros_comm --rosdistro noetic --deps --wet-only --tar > noetic-ros_comm-wet.rosinstall
#wstool init src noetic-ros_comm-wet.rosinstall

# Desktop
#rosinstall_generator desktop --rosdistro noetic --deps --wet-only --tar > noetic-desktop-wet.rosinstall
#wstool init -j8 src noetic-desktop-wet.rosinstall

# Desktop_Full
rosinstall_generator desktop_full --rosdistro noetic --deps --wet-only --tar > noetic-desktop_full-wet.rosinstall
wstool init -j8 src noetic-desktop_full-wet.rosinstall

rosdep install -y --from-paths src --ignore-src --rosdistro noetic -r --os=debian:buster

# compile
sudo src/catkin/bin/catkin_make_isolated --install -DCMAKE_BUILD_TYPE=Release --install-space /opt/ros/noetic -j1 -DPYTHON_EXECUTABLE=/usr/bin/python3


## Intel RealSense
wget https://github.com/IntelRealSense/librealsense/raw/master/scripts/libuvc_installation.sh
chmod +x ./libuvc_installation.sh
./libuvc_installation.sh
sudo rm -r -f libuvc_installation.sh

# Wait until Librealsense script completed message is displayed (may take some time)
# Connect RealSense device
# Run 'rs-enumerate-devices' from the terminal to verify the installation

# Installing ROS Package: realsense-ros
# source ROS
source /opt/ros/noetic/setup.bash

mkdir -p ~/catkin_ws/src
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
