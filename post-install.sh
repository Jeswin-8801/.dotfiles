#!/bin/sh

USERNAME=$(ls /home | grep -v 'lost+found' | head -n 1)

if ! $(find /home/$USERNAME/.config/nixos -type d -name "flake.nix"); then
    echo "unable to find nixos config files"
    exit 1
fi

# Prompt the user to enter a password
echo "Enter password for $USERNAME:"
passwd $USERNAME

# change ownership from root to user
chown -R "$USERNAME:$USERNAME" "/home/$USERNAME"

sudo nixos-rebuild switch --flake /home/$USERNAME/.config/nixos#jeswins-nix

# If successful
if [ $? -eq 0 ]; then
  # Reboot system
  reboot
fi