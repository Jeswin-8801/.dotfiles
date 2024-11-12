#!/bin/sh

if ! $(find /etc/nixos -type d -name "flake.nix"); then
    echo "unable to find nixos config files"
    exit 1
fi

# Define the username (make sure you update users.nix as well when changing USERNAME)
USERNAME="jeswins"
# Prompt the user to enter a password
echo "Enter password for $USERNAME:"
sudo passwd $USERNAME

# move all config files to the home directory in the mounted partition
if ! [ -d /mnt/home/.config ]; then
    sudo mkdir /mnt/home/.config
fi
sudo chown -R "$USERNAME:$USERNAME" /mnt/home/.config

sudo nixos-rebuild switch --flake /etc/nixos#jeswins-nix