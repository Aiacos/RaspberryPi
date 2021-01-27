#!/bin/bash

## Arduino ROS lib Build
source /opt/ros/noetic/setup.bash

cd ~/catkin_ws/src
git clone https://github.com/ros-drivers/rosserial.git
cd ~/catkin_ws
catkin_make
catkin_make install

## Arduino IDE Setup
mkdir -p ~/sketchbook/libraries
cd ~/sketchbook/libraries
rm -rf ros_lib
rosrun rosserial_arduino make_libraries.py ~/sketchbook/libraries
