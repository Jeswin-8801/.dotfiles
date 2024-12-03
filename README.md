# .dotfiles

NixOS ➕ Hyprland

## Installation

### On a minimal Nixos image

> ```bash
> nix-shell -p git fish --run fish
> git clone https://github.com/Jeswin-8801/dotfiles.git ~/.dotfiles && cd ~/.dotfiles
> ./install.sh
>
> ```

> [!Caution]
> The script `install.sh` must be run only once during a fresh installation.

After reboot, login as `root` and run:

> ```bash
> ./post-install.sh
>
> ```

### On an Existing Setup

> [!IMPORTANT]
> Change wherever necessary
> ```bash
> rg "CHANGEME"
> ```

> ```bash
> git clone https://github.com/Jeswin-8801/dotfiles.git ~/.config/nixos
> sudo nixos-rebuild switch --flake ~/.config/nixos#jeswins-nix
> ```

---

## References

- https://github.com/anotherhadi/nixy
- https://github.com/XNM1/linux-nixos-hyprland-config-dotfiles