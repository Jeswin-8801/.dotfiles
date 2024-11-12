#!/bin/sh

if ! $(find /etc/nixos -type d -name "flake.nix"); then
    echo "unable to find nixos config files"
    exit 1
fi

# Define the username (make sure you update users.nix as well when changing USERNAME)
USERNAME="jeswins"
# Prompt the user to enter a password
echo "Enter password for $USERNAME:"
passwd $USERNAME

# change ownership from root to user
chown -R "$USERNAME:users" "/home/$USERNAME/.config"

sudo nixos-rebuild switch --flake /etc/nixos#jeswins-nix