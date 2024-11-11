{ ... }:

{
  # Enable KDE Plasma
  services.xserver.enable = true;
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma.enable = true;
}
