#!/bin/bash

nix-shell -p ripgrep

VERSION=$(rg 'system.stateVersion' /etc/nixos/configuration.nix -o -r '$1' -e '.*"([^"]+)".*')
sed -i 's/your_version/$VERSION/g' nixos/configuration.nix

sudo cp -r nixos/* /etc/nixos
sudo chown -R root:root /etc/nixos

cp -r home/.config/* ~/.config

sudo nixos-rebuild switch --flake /etc/nixos#nixos