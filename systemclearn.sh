#!/bin/bash

echo "███████ ███████ ██████   ██████  ██████   █████      
       ██      ██      ██   ██ ██    ██ ██   ██ ██   ██     
       █████   █████   ██   ██ ██    ██ ██████  ███████     
       ██      ██      ██   ██ ██    ██ ██   ██ ██   ██     
       ██      ███████ ██████   ██████  ██   ██ ██   ██   "

# Update system and install necessary packages
sudo dnf -y update
sudo dnf -y install yum-utils

# Check if system needs update and update if necessary
if [ $(($(date +%s) - $(date +%s -r /var/log/dnf.log))) -ge $((60*60*24*5)) ]; then
  echo "System needs update. Updating now..."
  sudo dnf -y update
else
  echo "System updated within the last 5 days. Skipping update."
fi

# Clean up unnecessary packages
sudo dnf -y remove --setopt=clean_requirements_on_remove=True $(dnf repoquery --installonly --latest-limit=-1 -q)

# Check for system errors
echo "Checking for system errors..."
if ! journalctl -p 3 -xb; then
  echo "Journalctl command not found. Installing systemd-journal package..."
  sudo dnf install -y systemd-journal
  echo "Adding user to systemd-journal group..."
  sudo usermod -aG systemd-journal $(whoami)
  echo "Please log out and log back in for changes to take effect."
fi


