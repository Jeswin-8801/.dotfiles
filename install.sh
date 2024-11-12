#!/bin/sh

# Partition, Format and mount disk (if not already partitioned)
if ! $(lsblk | grep -q "sda[0-9]"); then
    sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko/latest -- --mode disko ./nixos/disk-config.nix
fi

# Generate configuration.nix and hardware-configuration.nix; And places them in /mnt/etc/nixos/
sudo nixos-generate-config --root /mnt

# Get system.stateVersion and update the file
VERSION=$(grep 'system.stateVersion' /mnt/etc/nixos/configuration.nix | sed -n 's/.*"\(.*\)".*/\1/p')
sed -i "s/your_version/$VERSION/g" nixos/configuration.nix

# Move all nixos config files to the mounted partition
sudo cp -r nixos/* /mnt/etc/nixos

# Define the username (make sure you update users.nix as well when changing USERNAME)
USERNAME="jeswins"

# move all config files to the home directory in the mounted partition
if ! [ -d "/mnt/home/$USERNAME/.config" ]; then
    sudo mkdir -p "/mnt/home/$USERNAME/.config"
fi
sudo cp -r home/.config/* "/mnt/home/$USERNAME/.config"

# move post-install.sh to /root
if ! [ -d /mnt/root ]; then
    sudo mkdir /mnt/root
fi
sudo cp post-install.sh /mnt/root

# Install Nixos
sudo nixos-install --root /mnt

# If the installation was successful
if [ $? -eq 0 ]; then
  # Reboot system
  reboot
fi