#!/bin/bash
set -e

# Setup your sources.list
echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list

# Set up your keys
apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654

# Environment
LANG=C.UTF-8
LC_ALL=C.UTF-8

# Installation
apt-get update
DEBIAN_FRONTEND=noninteractive apt-get install -y \
    ros-melodic-desktop-full \
    python-rosinstall python-rosinstall-generator python-wstool python-catkin-tools build-essential \
    ros-melodic-gazebo-ros-pkgs ros-melodic-ros-control

# Clear apt cashe
rm -rf /var/cache/apt

# Setup ros and catkin
CONFIGDIR="$(cd $(dirname $0); pwd -P)/config"
cat ${CONFIGDIR}/init_environment >> .bashrc