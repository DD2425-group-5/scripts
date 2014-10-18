#!/bin/bash
# This script sets up a catkin workspace in the specified directory (should be a
# home directory), and then adds a line to .bashrc to allow the use of ros
# commands. The arduino_msgs package is also symlinked to the home directory and
# then compiled so that it can be used.
if [ "$#" -eq 0 ]; then
    HOME=~
else
    HOME=$1
fi

echo "Setting up catkin in $HOME"

source /opt/ros/hydro/setup.bash # get ros commands and stuff
mkdir -p $HOME/catkin_ws/src # create workspace directory for catkin
cd $HOME/catkin_ws/src
catkin_init_workspace # initialise the workspace
cd $HOME/catkin_ws
catkin_make # make the various bits that are in the workspace
source devel/setup.bash
# load the new setup file on bash load
echo "source $HOME/catkin_ws/devel/setup.bash" >> $HOME/.bashrc
# update the package path so that stuff in catkin is used
echo "ROS_PACKAGE_PATH=$ROS_PACKAGE_PATH:~/catkin_ws/src"
# update cmake so that it can find the executables in catkin
echo "CMAKE_PREFIX_PATH=$CMAKE_PREFIX_PATH:~/catkin_ws/devel"
# make a symbolic link to the arduino messages so that they can be found by the
# compiler on the current user.
ln -s /home/ras/catkin_ws/src/ras_arduino_msgs/ $HOME/catkin_ws/src
cd $HOME/catkin_ws
# run catkin make to compile the arduino messages. Crashes the first
# time, so run twice?
catkin_make
catkin_make
