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
sudo nixos-install --flake /mnt/etc/nixos#jeswins-nix

# Define the username (make sure you update users.nix as well when changing USERNAME)
USERNAME="jeswins"
# Create the user
sudo useradd $USERNAME
# Prompt the user to enter a password
echo "Enter password for $USERNAME:"
sudo passwd $USERNAME

# move all config files to the home directory in the mounted partition
if ! [ -d /mnt/home/.config ]; then
    sudo mkdir /mnt/home/.config
fi
sudo chown -R "$USERNAME:$USERNAME" /mnt/home/.config

# Reboot system
sudo reboot