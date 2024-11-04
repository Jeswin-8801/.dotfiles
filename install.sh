#!/bin/sh

VERSION=$(rg -No 'system.stateVersion = \s*"([^"]+)"' /etc/nixos/configuration.nix -r '$1')
sed -i 's/your_version/$VERSION/g' nixos/configuration.nix

sudo cp nixos/* /etc/nixos
sudo chown -R root:root /etc/nixos

cp -r home/.config/* ~/.config

sudo nixos-rebuild switch --flake /etc/nixos#nixos