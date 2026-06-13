FROM ros:humble-ros-core

# ROS Packages
RUN apt-get update && apt-get install -y \
    ros-humble-foxglove-bridge \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*