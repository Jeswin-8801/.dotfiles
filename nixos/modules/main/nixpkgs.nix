{ pkgs, ... }:

{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  
  # Override packages
  # nixpkgs.config.packageOverrides = pkgs: {
  #   nur = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz") {
  #     inherit pkgs;
  #   };
  # };

  # System wide packages
  environment.systemPackages = with pkgs; [
    at-spi2-atk
    qt6.qtwayland
    psi-notify
    poweralertd
    playerctl
    psmisc
    grim
    slurp
    imagemagick
    swappy
    ffmpeg_6-full
    wl-screenrec
    wl-clipboard
    wl-clip-persist
    cliphist
    xdg-utils
    wtype
    wlrctl
    waybar
    rofi-wayland
    dunst
    avizo
    wlogout
    gifsicle
  ];
}
