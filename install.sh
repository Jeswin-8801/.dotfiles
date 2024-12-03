#!/bin/sh

# Partition, Format and mount disk (if not already partitioned)
if ! $(lsblk | grep -q "sda[0-9]"); then
    sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko/latest -- --mode disko ./hosts/laptop/disk-config.nix
fi

# Generate configuration.nix and hardware-configuration.nix; And places them in /mnt/etc/nixos/
sudo nixos-generate-config --root /mnt

# Get system.stateVersion and update the file
VERSION=$(grep 'system.stateVersion' /mnt/etc/nixos/configuration.nix | sed -n 's/.*"\(.*\)".*/\1/p')
sed -i 's/[0-9]\+\.[0-9]\+/$VERSION/g' hosts/laptop/configuration.nix

# Define the username (make sure you update hosts/laptop/variables.nix as well when changing USERNAME)
USERNAME="jeswins"

# move all config files to the home directory in the mounted partition
if ! [ -d "/mnt/home/$USERNAME/.config" ]; then
    sudo mkdir -p "/mnt/home/$USERNAME/.config"
fi
sudo cp -r * "/mnt/home/$USERNAME/.config/nixos"
sudo rm -f "/mnt/home/$USERNAME/.config/nixos/*install.sh" # remove so that it is never run accidentally in the future

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