#!/bin/bash
#This script runs the commands to download and install ras_msgs and espeak packages. This is needed 
#to be able to compile the vision package.
if [ "$#" -eq 0 ]; then
    HOME=~
else
    HOME=$1
fi

cd $HOME/catkin_ws/src
wget https://raw.githubusercontent.com/KTH-RAS/ras_install/hydro-2014/rosinstall/ras_utils.rosinstall
wstool init
wstool merge ras_utils.rosinstall
wstool update
