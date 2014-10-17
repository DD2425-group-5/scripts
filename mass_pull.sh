#!/bin/bash
# Use this to go through all the directories in the specified
# directory and pull updated code from the origin
for d in */; do
    dname=${d%?}
    echo -e "\nvvvvvvvvvvvvvvvvvvvv ${dname^^} vvvvvvvvvvvvvvvvvvvv\n"
    echo "Updating $dname from origin..."
    cd $dname
    git pull
    cd ..
done

echo "Make sure to fix merge conflicts, if there were any."

