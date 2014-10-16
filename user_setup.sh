#!/bin/bash
groupadd robo
#names=(michal yavor christoffer dmitrij alan)
names=(test)
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


