#!/bin/bash

# Display welcome message
echo "Welcome to Fedora!"

# Update system
sudo dnf update -y

# Free up space
sudo dnf clean all

# Show free space
df -h

# Display date of last update and clean
echo "Packages last updated and cleaned on: "
rpm -qa --last | awk '{print $1 " " $2 " " $3 " " $4}'

# Clear terminal
clear

