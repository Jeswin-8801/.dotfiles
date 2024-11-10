#!/bin/sh

nix-shell -p ripgrep git fish --run fish
git clone https://github.com/Jeswin-8801/.dotfiles.git && cd .dotfiles

VERSION=$(rg -No 'system.stateVersion = \s*"([^"]+)"' /etc/nixos/configuration.nix -r '$1')
sed -i 's/your_version/$VERSION/g' nixos/configuration.nix

sudo cp nixos/* /etc/nixos
sudo chown -R root:root /etc/nixos

cp -r home/.config/* ~/.config

sudo nixos-rebuild switch --flake /etc/nixos#nix