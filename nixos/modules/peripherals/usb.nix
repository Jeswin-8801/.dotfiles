{ pkgs, ... }:

{
  # USB Automounting
  # services.gvfs.enable = true; # Gnome virtual file system
  services.udisks2.enable = true; # Helps with device management (https://wiki.archlinux.org/title/Udisks)

  # Enable USB Guard
  services.usbguard = {
    enable = false; # FIXME: enable if usb devices has been added to <rules>
    dbus.enable = true;
    implicitPolicyTarget = "block";
    # FIXME: set yours pref USB devices (change {id} to your trusted USB device), use `lsusb` command (from usbutils package) to get list of all connected USB devices including integrated devices like camera, bluetooth, wifi, etc. with their IDs or just disable `usbguard`
    rules = ''
      allow id {id} # device 1
      allow id {id} # device 2
    '';
  };

  # Enable USB-specific packages
  environment.systemPackages = with pkgs; [
    usbutils
    kio-fuse # Allows access to remote filesystems in KDE Plasma
  ];
}
