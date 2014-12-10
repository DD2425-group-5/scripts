#!/bin/bash

rostopic pub /odometry/odometry hardware_msgs/Odometry "{distanceTotal: 0.0, distanceFromLast: 0.0, totalX: 1.6, totalY: 0.0, latestHeading: -90}"
rostopic pub /vision/detection vision_msgs/object_found "id: 'green_cylinder'
offset_x: -0.2
offset_y: 0.4"
rostopic pub /odometry/odometry hardware_msgs/Odometry "{distanceTotal: 0.0, distanceFromLast: 0.0, totalX: 2.5, totalY: 0.0, latestHeading: 0.0}"
rostopic pub /controller/turn controller_msgs/Turning "isTurning: true
degrees: 0.0"
rostopic pub /odometry/odometry hardware_msgs/Odometry "{distanceTotal: 0.0, distanceFromLast: 0.0, totalX: 2.5, totalY: 1.1, latestHeading: 0.0}"
rostopic pub /vision/detection vision_msgs/object_found "id: 'purple_cross'
offset_x: 0.1
offset_y: 0.4"
rostopic pub /odometry/odometry hardware_msgs/Odometry "{distanceTotal: 0.0, distanceFromLast: 0.0, totalX: 2.5, totalY: 2.8, latestHeading: -90}"
rostopic pub /controller/turn controller_msgs/Turning "isTurning: true
degrees: 0.0"
rostopic pub /odometry/odometry hardware_msgs/Odometry "{distanceTotal: 0.0, distanceFromLast: 0.0, totalX: 2.7, totalY: 2.8, latestHeading: -90}"
rostopic pub /vision/detection vision_msgs/object_found "id: 'blue_sphere'
offset_x: 0.05
offset_y: 0.5"
rostopic pub /odometry/odometry hardware_msgs/Odometry "{distanceTotal: 0.0, distanceFromLast: 0.0, totalX: 3, totalY: 2.8, latestHeading: 0.0}"
rostopic pub /controller/turn controller_msgs/Turning "isTurning: true
degrees: 0.0"
rostopic pub /odometry/odometry hardware_msgs/Odometry "{distanceTotal: 0.0, distanceFromLast: 0.0, totalX: 3, totalY: 3.1, latestHeading: 0.0}"
rostopic pub /vision/detection vision_msgs/object_found "id: 'red_cube'
offset_x: 0.2
offset_y: 0.3"
rostopic pub /odometry/odometry hardware_msgs/Odometry "{distanceTotal: 0.0, distanceFromLast: 0.0, totalX: 3, totalY: 3.3, latestHeading: 0.0}"
rostopic pub /controller/turn controller_msgs/Turning "isTurning: true
degrees: 0.0"
