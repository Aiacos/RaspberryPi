## Update
sudo apt update && upgrade -y
sudo apt autoremove -y

## Argon One Util
curl https://download.argon40.com/argon1.sh | bash

## Install Software
sudo apt install blender -y
sudo apt install arduino -y
sudo apt install xrdp -y

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

# Desktop Install
rosinstall_generator desktop --rosdistro noetic --deps --wet-only --tar > noetic-desktop-wet.rosinstall
wstool init -j8 src noetic-desktop-wet.rosinstall

rosdep install -y --from-paths src --ignore-src --rosdistro noetic -r --os=debian:buster

# compile
sudo src/catkin/bin/catkin_make_isolated --install -DCMAKE_BUILD_TYPE=Release --install-space /opt/ros/noetic -j1 -DPYTHON_EXECUTABLE=/usr/bin/python3

# cleanup
cd
sudo rm -r -f ros_catkin_ws

# test
source /opt/ros/noetic/setup.bash
roscd
#roscore
