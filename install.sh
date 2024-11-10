#!/bin/sh

sudo nixos-generate-config

VERSION=$(rg -No 'system.stateVersion = \s*"([^"]+)"' /etc/nixos/configuration.nix -r '$1')
sed -i 's/your_version/$VERSION/g' nixos/configuration.nix
sudo sed -i '/fileSystems/,/\};/d' /etc/nixos/hardware-configuration.nix

sudo mkdir -p /mnt/etc/nixos
sudo cp /etc/nixos/hardware-configuration.nix /mnt/etc/nixos/
sudo cp -r nixos/* /mnt/etc/nixos

cp -r home/.config/* ~/.config

sudo nixos-install --flake /etc/nixos#jeswins-nix