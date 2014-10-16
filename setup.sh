#!/bin/bash
source /opt/ros/hydro/setup.bash # get ros commands and stuff
mkdir -p ~/catkin_ws/src # create workspace directory for catkin
cd ~/catkin_ws/src
catkin_init_workspace # initialise the workspace
cd ~/catkin_ws
catkin_make # make the various bits that are in the workspace
source devel/setup.bash
echo "source ~/catkin_ws/devel/setup.bash" >> ~/.bashrc