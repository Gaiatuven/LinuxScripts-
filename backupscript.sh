#!/bin/bash
echo 
echo 
echo 
echo"

▀█████████▄     ▄████████  ▄████████    ▄█   ▄█▄ ███    █▄     ▄███████▄    ▄████████  ▄████████    ▄████████  ▄█     ▄███████▄     ███     
  ███    ███   ███    ███ ███    ███   ███ ▄███▀ ███    ███   ███    ███   ███    ███ ███    ███   ███    ███ ███    ███    ███ ▀█████████▄ 
  ███    ███   ███    ███ ███    █▀    ███▐██▀   ███    ███   ███    ███   ███    █▀  ███    █▀    ███    ███ ███▌   ███    ███    ▀███▀▀██ 
 ▄███▄▄▄██▀    ███    ███ ███         ▄█████▀    ███    ███   ███    ███   ███        ███         ▄███▄▄▄▄██▀ ███▌   ███    ███     ███   ▀ 
▀▀███▀▀▀██▄  ▀███████████ ███        ▀▀█████▄    ███    ███ ▀█████████▀  ▀███████████ ███        ▀▀███▀▀▀▀▀   ███▌ ▀█████████▀      ███     
  ███    ██▄   ███    ███ ███    █▄    ███▐██▄   ███    ███   ███                 ███ ███    █▄  ▀███████████ ███    ███            ███     
  ███    ███   ███    ███ ███    ███   ███ ▀███▄ ███    ███   ███           ▄█    ███ ███    ███   ███    ███ ███    ███            ███     
▄█████████▀    ███    █▀  ████████▀    ███   ▀█▀ ████████▀   ▄████▀       ▄████████▀  ████████▀    ███    ███ █▀    ▄████▀         ▄████▀   
                                       ▀                                                           ███    ███                               "

# Set backup directory and filename
BACKUP_DIR="/home/gaia/Documents/backups"
BACKUP_FILENAME="backupscripts-$(date +%Y-%m-%d-%H-%M-%S).tar.gz"

# Create backup directory if it doesn't exist
if [ ! -d "$BACKUP_DIR" ]; then
  mkdir "$BACKUP_DIR"
fi

# Create compressed backup of backupscripts folder
tar -czf "$BACKUP_DIR/$BACKUP_FILENAME" "/home/gaia/Documents/backupscripts"

echo "Backup of backupscripts folder created at $BACKUP_DIR/$BACKUP_FILENAME"

