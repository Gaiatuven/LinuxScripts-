#!/bin/bash

echo"<Right  ██████▓██   ██▓  ██████ ▄▄▄█████▓▓█████  ███▄ ▄███▓ ▄████▄   ▄▄▄       ██▀███  ▓█████        ██████  ██░ ██ 
▒██    ▒ ▒██  ██▒▒██    ▒ ▓  ██▒ ▓▒▓█   ▀ ▓██▒▀█▀ ██▒▒██▀ ▀█  ▒████▄    ▓██ ▒ ██▒▓█   ▀      ▒██    ▒ ▓██░ ██▒
░ ▓██▄    ▒██ ██░░ ▓██▄   ▒ ▓██░ ▒░▒███   ▓██    ▓██░▒▓█    ▄ ▒██  ▀█▄  ▓██ ░▄█ ▒▒███        ░ ▓██▄   ▒██▀▀██░
  ▒   ██▒ ░ ▐██▓░  ▒   ██▒░ ▓██▓ ░ ▒▓█  ▄ ▒██    ▒██ ▒▓▓▄ ▄██▒░██▄▄▄▄██ ▒██▀▀█▄  ▒▓█  ▄        ▒   ██▒░▓█ ░██ 
▒██████▒▒ ░ ██▒▓░▒██████▒▒  ▒██▒ ░ ░▒████▒▒██▒   ░██▒▒ ▓███▀ ░ ▓█   ▓██▒░██▓ ▒██▒░▒████▒ ██▓ ▒██████▒▒░▓█▒░██▓
▒ ▒▓▒ ▒ ░  ██▒▒▒ ▒ ▒▓▒ ▒ ░  ▒ ░░   ░░ ▒░ ░░ ▒░   ░  ░░ ░▒ ▒  ░ ▒▒   ▓▒█░░ ▒▓ ░▒▓░░░ ▒░ ░ ▒▓▒ ▒ ▒▓▒ ▒ ░ ▒ ░░▒░▒
░ ░▒  ░ ░▓██ ░▒░ ░ ░▒  ░ ░    ░     ░ ░  ░░  ░      ░  ░  ▒     ▒   ▒▒ ░  ░▒ ░ ▒░ ░ ░  ░ ░▒  ░ ░▒  ░ ░ ▒ ░▒░ ░
░  ░  ░  ▒ ▒ ░░  ░  ░  ░    ░         ░   ░      ░   ░          ░   ▒     ░░   ░    ░    ░   ░  ░  ░   ░  ░░ ░
      ░  ░ ░           ░              ░  ░       ░   ░ ░            ░  ░   ░        ░  ░  ░        ░   ░  ░  ░
         ░ ░                                         ░                                    ░                   "

echo 
echo 

# Update system
echo "Updating system..."
sudo pacman -Syu

# Remove orphan packages
echo "Removing orphan packages..."
sudo pacman -Rns $(pacman -Qtdq)

# Clean package cache
echo "Cleaning package cache..."
sudo paccache -r

# Remove unused dependencies
echo "Removing unused dependencies..."
sudo pacman -Qtdq | sudo pacman -Rs -

# Remove unused AUR packages
echo "Removing unused AUR packages..."
aurphan -q | sudo pacman -Rns -

echo "Maintenance complete."


