#!/bin/sh

sudo nixos-generate-config --root /mnt

VERSION=$(grep 'system.stateVersion' /mnt/etc/nixos/configuration.nix | sed -n 's/.*"\(.*\)".*/\1/p')
sed -i "s/your_version/$VERSION/g" nixos/configuration.nix
sudo sed -i '/fileSystems/,/\};/d' /mnt/etc/nixos/hardware-configuration.nix

sudo cp -r nixos/* /mnt/etc/nixos

cp -r home/.config/* ~/.config

sudo nixos-install --flake /mnt/etc/nixos#jeswins-nix