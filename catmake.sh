#!/bin/bash
pushd ~/catkin_ws
catkin_make $1 --cmake-args -DCMAKE_CXX_FLAGS="-Wall"
popd
