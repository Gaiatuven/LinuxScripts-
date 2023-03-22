#!/bin/bash

# Update the system
sudo dnf update -y

# Display a list of all hard drives including those not visible in the terminal
sudo lsblk -o NAME,FSTYPE,SIZE,MOUNTPOINT,LABEL,MODEL

# Exit the script
exit 0

