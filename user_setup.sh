#!/bin/bash
# Creates a group to be used to allow users to modify files in the ras
# directory, and creates users if they do not exist. Also sets up a
# catkin workspace in each user's home directory as well as copying over a
# .bashrc file. Users are added to the sudo group, as well as some others.
groupadd robo
names=(michal yavor christoffer dmitrij alan)
for name in ${names[*]}; do
    # only create the use if it doesn't already exist
    echo $name
    id -u $name
    if [ $? -eq 1 ]; then
	echo "Creating user $name."
	sudo useradd -m $name -G robo,sudo,adm,lpadmin,sambashare
	sudo cp /home/ras/.bashrc /home/$name
	sudo bash ./catkin_setup.sh /home/$name
    else
	echo "User $name already exists. Skipping."
    fi
done


