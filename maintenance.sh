#!/bin/bash

# Update the system
sudo dnf update -y

# Remove unnecessary packages and old kernels
sudo dnf autoremove -y
sudo package-cleanup --oldkernels --count=1 -y

# Clean up temporary files
sudo dnf clean all
sudo rm -rf /var/cache/dnf/*
sudo rm -rf /var/cache/PackageKit/*
sudo rm -rf /var/tmp/*

# Clean up log files
sudo journalctl --vacuum-size=100M
sudo rm -rf /var/log/journal/*

# Check for and fix broken dependencies
sudo dnf check
sudo dnf distro-sync -y

# Check for and fix broken file systems
sudo fsck /dev/sda1

# Monitor system resources and take actions if needed
# Replace <threshold> with desired threshold values
if [ $(free | awk '/^Mem:/ {print $3/$2*100}') -gt <threshold> ]; then
    echo "Memory usage is high, taking action..."
    # Take action here, such as killing a process or restarting a service
fi

if [ $(df | awk '/<partition>/ {print $5}' | tr -d '%') -gt <threshold> ]; then
    echo "Disk usage is high, taking action..."
    # Take action here, such as cleaning up files or expanding the disk
fi

if [ $(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}') -gt <threshold> ]; then
    echo "CPU usage is high, taking action..."
    # Take action here, such as killing a process or setting CPU affinity
fi

# Create backups of important data and configurations
# Replace <backup_dir> with desired backup directory
sudo tar -czvf <backup_dir>/backup-$(date +%Y-%m-%d-%H-%M-%S).tar.gz /home/user/Documents /etc/important-configs/

