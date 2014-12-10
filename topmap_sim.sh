#!/bin/bash

# node 1
rostopic pub /odometry/odometry hardware_msgs/Odometry "{distanceTotal: 0.0, distanceFromLast: 0.0, totalX: 1.6, totalY: 0.0, latestHeading: -90}"
rostopic pub /vision/detection vision_msgs/object_found "id: 'green_cylinder'
offset_x: -0.2
offset_y: 0.4"

# node 3
rostopic pub /odometry/odometry hardware_msgs/Odometry "{distanceTotal: 0.0, distanceFromLast: 0.0, totalX: 2.5, totalY: 0.0, latestHeading: 0.0}"
rostopic pub /controller/turn controller_msgs/Turning "isTurning: true
degrees: 0.0"
# end of first straight line, turned left 90

# node 4
rostopic pub /odometry/odometry hardware_msgs/Odometry "{distanceTotal: 0.0, distanceFromLast: 0.0, totalX: 2.5, totalY: 1.1, latestHeading: 0.0}"
rostopic pub /vision/detection vision_msgs/object_found "id: 'purple_cross'
offset_x: -0.1
offset_y: 0.4"

# node 6
rostopic pub /odometry/odometry hardware_msgs/Odometry "{distanceTotal: 0.0, distanceFromLast: 0.0, totalX: 2.5, totalY: 1.7, latestHeading: -90}"
rostopic pub /controller/turn controller_msgs/Turning "isTurning: true
degrees: 0.0"
# end of second straight line, turned right 90

# node 7
rostopic pub /odometry/odometry hardware_msgs/Odometry "{distanceTotal: 0.0, distanceFromLast: 0.0, totalX: 2.9, totalY: 1.7, latestHeading: -90}"
rostopic pub /vision/detection vision_msgs/object_found "id: 'blue_sphere'
offset_x: 0.05
offset_y: 0.5"

# node 9
rostopic pub /odometry/odometry hardware_msgs/Odometry "{distanceTotal: 0.0, distanceFromLast: 0.0, totalX: 3.2, totalY: 1.7, latestHeading: 0.0}"
rostopic pub /controller/turn controller_msgs/Turning "isTurning: true
degrees: 0.0"
# end of third straight line, turned left 90

#  node 10
rostopic pub /odometry/odometry hardware_msgs/Odometry "{distanceTotal: 0.0, distanceFromLast: 0.0, totalX: 3.2, totalY: 2.1, latestHeading: 0.0}"
rostopic pub /vision/detection vision_msgs/object_found "id: 'red_cube'
offset_x: 0.2
offset_y: 0.3"

# node 12
rostopic pub /odometry/odometry hardware_msgs/Odometry "{distanceTotal: 0.0, distanceFromLast: 0.0, totalX: 3.2, totalY: 2.7, latestHeading: 90}"
rostopic pub /controller/turn controller_msgs/Turning "isTurning: true
degrees: 0.0"
# end of fourth straight line, turned left 90

# node 13
rostopic pub /odometry/odometry hardware_msgs/Odometry "{distanceTotal: 0.0, distanceFromLast: 0.0, totalX: 2.9, totalY: 2.7, latestHeading: -180}"
rostopic pub /controller/turn controller_msgs/Turning "isTurning: true
degrees: 0.0"
# end of fifth straight line, turned left 90

# node 14, close to node 7. should be merged
rostopic pub /odometry/odometry hardware_msgs/Odometry "{distanceTotal: 0.0, distanceFromLast: 0.0, totalX: 2.9, totalY: 1.6, latestHeading: -180}"
rostopic pub /vision/detection vision_msgs/object_found "id: 'blue_cube'
offset_x: -0.1
offset_y: 0.4"

# node 16
rostopic pub /odometry/odometry hardware_msgs/Odometry "{distanceTotal: 0.0, distanceFromLast: 0.0, totalX: 2.9, totalY: 0.5, latestHeading: 90}"
rostopic pub /controller/turn controller_msgs/Turning "isTurning: true
degrees: 0.0"
# end of sixth straight line, turned right 90

# node 17
rostopic pub /odometry/odometry hardware_msgs/Odometry "{distanceTotal: 0.0, distanceFromLast: 0.0, totalX: 1.6, totalY: 0.5, latestHeading: 180}"
rostopic pub /controller/turn controller_msgs/Turning "isTurning: true
degrees: 0.0"
#end of seventh straight line segment, turn left 90

# node 18
rostopic pub /odometry/odometry hardware_msgs/Odometry "{distanceTotal: 0.0, distanceFromLast: 0.0, totalX: 1.6, totalY: 0, latestHeading: 90}"
rostopic pub /controller/turn controller_msgs/Turning "isTurning: true
degrees: 0.0"
# end at node 1
