alias colbu_rd="colcon build --symlink-install --cmake-args -DCMAKE_BUILD_TYPE=RelWithDebInfo -DCMAKE_EXPORT_COMPILE_COMMANDS=1 "
alias colbu_r="colcon build --symlink-install --cmake-args -DCMAKE_BUILD_TYPE=Release -DCMAKE_EXPORT_COMPILE_COMMANDS=1 "
alias colbu_d="colcon build --symlink-install --cmake-args -DCMAKE_BUILD_TYPE=Debug -DCMAKE_EXPORT_COMPILE_COMMANDS=1 "

alias colbu_sel_rd="colbu_rd --packages-select "
alias colbu_sel_r="colbu_r --packages-select "
alias colbu_sel_d="colbu_d --packages-select "

alias colbu_upto_rd="colbu_rd --packages-up-to "
alias colbu_upto_r="colbu_r --packages-up-to "
alias colbu_upto_d="colbu_r --packages-up-to "

alias soii="source install/setup.bash"

alias auto_sor="source ~/projects/autoware/install/setup.bash"
alias autt="cd ~/projects/autoware/ && source ~/projects/autoware/install/setup.bash"

alias run_autoware="auto_sor && ros2 launch autoware_launch isuzu.launch.xml map_path:=/home/volt/projects/gebze_map vehicle_model:=isuzu_vehicle sensor_model:=isuzu_sensor"

alias auto_engage="auto_sor && ros2 topic pub /autoware/engage autoware_auto_vehicle_msgs/msg/Engage 'engage: true' -1"

alias run_container="/home/volt/projects/volt_scripts/test/perception/pointcloud_container.sh"

alias bag_loc="~/projects/volt_scripts/test/bag/localization.sh"
alias bag_perp="~/projects/volt_scripts/test/bag/perception.sh"
alias bag_plan="~/projects/volt_scripts/test/bag/planning/planning.sh"
alias bag_all="~/projects/volt_scripts/test/bag/all-topics.sh"
 
alias sorog="source /opt/ros/galactic/setup.bash"
alias soroh="source /opt/ros/humble/setup.bash"

alias run_motion="~/projects/volt_scripts/test/planning/run_motion_planning.sh"

alias run_all="soroh && ~/projects/volt_scripts/test/run_all.sh"

alias rm="trashy"

alias clean_ws="trashy install log && ls build/ --color=auto -a  | grep -xv -e '.idea' -e '.' -e '..' -e 'compile_commands.json' -e '.built_by' | sed 's/.*/\"build\/&\"/' | xargs -I{} bash -c 'trashy {}'"

clean_pkg () {
  find build install -maxdepth 1 -name ${1} | sed 's/.*/\"&\"/' | xargs -I{} bash -c 'trashy {}'
}

alias startup_main="/home/volt/projects/volt_scripts/startup_main.sh"

record_planning_inputs () {
ros2 bag record -o ros2bag_planning_inputs-${1} \
/tf \
/localization/kinematic_state \
/map/vector_map \
/perception/object_recognition/objects \
/perception/obstacle_segmentation/pointcloud \
/perception/occupancy_grid_map/map \
/perception/object_recognition/detection/traffic_signals \
/planning/mission_planning/goal \
/planning/mission_planning/check_point
}

record_planning_outputs () {
ros2 bag record -o ros2bag_planning_outputs-${1} \
/planning/scenario_planning/trajectory \
/planning/scenario_planning/lane_driving/trajectory \
/planning/scenario_planning/lane_driving/behavior_planning/path_with_lane_id \
/planning/scenario_planning/lane_driving/behavior_planning/path
}

auto_pub_goal(){
ros2 topic pub --once /planning/mission_planning/goal geometry_msgs/PoseStamped "{header: {stamp: now, frame_id: 'map'}, pose: {position: {x: $1, y: $2, z: $3}, orientation: {x: $4, y: $5, z: $6, w: $7}}}"
}
