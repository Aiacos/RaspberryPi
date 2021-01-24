#!/bin/bash

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
