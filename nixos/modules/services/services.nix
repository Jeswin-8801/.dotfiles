{ pkgs, ... }:  {

  # Systemd services setup
  systemd.packages = with pkgs; [
    # https://github.com/AdnanHodzic/auto-cpufreq
    auto-cpufreq
  ];

  services.auto-cpufreq.enable = true;
  services.power-profiles-daemon.enable = false; # disabled so that it does not conflict with auto-cpufreq
  
  programs.direnv.enable = true;
  services.upower.enable = true;
  programs.dconf.enable = true;
  services.dbus = {
    enable = true;
    implementation = "broker";
    packages = with pkgs; [
      gnome2.GConf
    ];
  };

  services.mpd.enable = true;
  programs.thunar.enable = true;
  programs.xfconf.enable = true;
  services.tumbler.enable = true; 
  services.fwupd.enable = true;
  services.devmon.enable = true; # SNMP
  
  services.gnome.core-shell.enable = true;
  services.udev.packages = with pkgs; [ gnome.gnome-settings-daemon ];

  # Faster rebuilding
  documentation = {
    enable = true;
    doc.enable = false;
    man.enable = true;
    dev.enable = false;
    info.enable = false;
    nixos.enable = false;
  };

  services.logind.extraConfig = ''
    # don’t shutdown when power button is short-pressed
    HandlePowerKey=ignore
  '';

  # System wide packages
  environment.systemPackages = with pkgs; [
    psi-notify # Alerts users when resources on their machine are becoming oversaturated, allowing them to take action before the system slows down
    poweralertd # Provides power notifications using upower
    psmisc # Provides utilities for managing processes, such as pstree, killall, and fuser
    
    xdg-utils # Set of tools that assist applications with tasks like opening URLs and managing desktop entries
    
    dunst # Customizable notification daemon
    avizo # Manages audio volume on Wayland
    wlogout # Logout menu for Wayland
    
    fd
    bc
    gcc
    git-ignore
    wget
    curl
  ]; 
}
