# .dotfiles

NixOS ➕ Hyprland

# Install

This installation is run on a minimal Nixos image.

> ```bash
> nix-shell -p git fish --run fish
> git clone https://github.com/Jeswin-8801/.dotfiles.git && cd .dotfiles
> ./install.sh
>
> ```

> [!Caution]
> The script `install.sh` must be run only once during a fresh installation.

After reboot run:

> ```bash
> cd .dotfiles && ./post-install.sh
>
> ```