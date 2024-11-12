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

# Install Nixos
sudo nixos-install --root /mnt

# If the installation was successful
if [ $? -eq 0 ]; then
  # Reboot system
  reboot
fi