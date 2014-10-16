#!/bin/bash
source /opt/ros/hydro/setup.bash # get ros commands and stuff
mkdir -p ~/catkin_ws/src # create workspace directory for catkin
cd ~/catkin_ws/src
catkin_init_workspace # initialise the workspace
cd ~/catkin_ws
catkin_make # make the various bits that are in the workspace
source devel/setup.bash
echo "source ~/catkin_ws/devel/setup.bash" >> ~/.bashrc # load the new setup file on bash load
# make a symbolic link to the arduino messages so that they can be found by the compiler on
# the current user.
ln -s /home/ras/catkin_ws/src/ras_arduino_msgs/ ~/catkin_ws/src
cd ~/catkin_ws
# run catkin make to compile the arduino messages. Crashes the first
# time, so run twice?
catkin_make
catkin_make
