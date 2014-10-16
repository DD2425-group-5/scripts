#!/bin/bash
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
echo "source $HOME/catkin_ws/devel/setup.bash" >> $HOME/.bashrc # load the new setup file on bash load
# make a symbolic link to the arduino messages so that they can be found by the compiler on
# the current user.
ln -s /home/ras/catkin_ws/src/ras_arduino_msgs/ $HOME/catkin_ws/src
cd $HOME/catkin_ws
# run catkin make to compile the arduino messages. Crashes the first
# time, so run twice?
catkin_make
catkin_make
