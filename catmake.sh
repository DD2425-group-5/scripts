#!/bin/bash
pushd ~/catkin_ws
catkin_make $@ --cmake-args -DCMAKE_CXX_FLAGS="-Wall"
popd
