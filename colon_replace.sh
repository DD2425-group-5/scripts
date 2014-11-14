#!/bin/bash

find $1 -type f| while read file; do
    newname=$(echo $file | sed 's/:/_/g')
    echo "Moving $file to $newname"
    mv $file $newname
done
