## Update
sudo apt update && upgrade -y
sudo apt autoremove -y

## Settings
sudo timedatectl set-timezone Europe/London
sudo apt install htpdate -y

## Argon One Util
curl https://download.argon40.com/argon1.sh | bash

## Install GUI
sudo apt install ubuntu-budgie-desktop -y
sudo snap install ubuntu-budgie-welcome --classic

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
echo "source ~/catkin_ws/devel/setup.bash" >> ~/.bashrc
source ~/.bashrc


## Environment setup
#echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc
#echo "source ~/catkin_ws/devel/setup.bash" >> ~/.bashrc
#source ~/.bashrc


## Test

# test ROS
#source /opt/ros/noetic/setup.bash
#roscd
#roscore

# test RealSense
#/opt/realsense/bin/realsense-viewer
#roslaunch realsense2_camera rs_camera.launch
