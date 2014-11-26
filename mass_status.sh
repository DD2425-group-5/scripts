#!/bin/bash
# Run this in the directory above where the git repositories are to check status for all of them
find `pwd` -maxdepth 1 -type d | while read dir; do echo $dir; cd $dir; git status; cd ..; done
