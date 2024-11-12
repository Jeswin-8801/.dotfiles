{ pkgs, ... }:

{
  # Systemd services setup
  systemd.packages = with pkgs; [
    # https://github.com/AdnanHodzic/auto-cpufreq
    auto-cpufreq
  ];

  # Enable Services

  # disabled so that it does not conflict with auto-cpufreq
  services.power-profiles-daemon.enable = false;
  services.auto-cpufreq.enable = true;
  
  programs.direnv.enable = true;
  services.upower.enable = true;
  programs.dconf.enable = true;
  services.dbus = {
    enable = true;
    implementation = "broker";
    packages = with pkgs; [
      # For xfce
      xfce.xfconf

      # For gnome
      # gnome2.GConf

      # For plasma6
      kdePackages.kconfig
    ];
  };
  services.mpd.enable = true;
  programs.thunar.enable = true;
  programs.xfconf.enable = true;
  services.tumbler.enable = true; 
  services.fwupd.enable = true;
  # services.devmon.enable = true; # SNMP
  
  # services.gnome.core-shell.enable = true;
  # services.udev.packages = with pkgs; [ gnome.gnome-settings-daemon ];

  # System wide packages
  environment.systemPackages = with pkgs; [
    at-spi2-atk # Allows assistive technologies like screen readers to interact with applications
    qt6.qtwayland # Allows Qt applications to run as clients on a Wayland display server
    psi-notify # Alerts users when resources on their machine are becoming oversaturated, allowing them to take action before the system slows down
    poweralertd # Provides power notifications using upower
    playerctl # Interface to interact with media players and manage playback
    psmisc # Provides utilities for managing processes, such as pstree, killall, and fuser
    grim # Tool for taking screenshots on Wayland compositors
    slurp # Allows you to select a region of the screen interactively, often used with grim
    imagemagick # A suite for displaying, converting, and editing raster and vector image files
    swappy # Wayland-native snapshot editing tool
    ffmpeg # Comprehensive multimedia framework for recording, converting, and streaming audio and video
    wl-screenrec # Screen recording tool for Wayland
    wl-clipboard # Provides command-line tools to interact with the Wayland clipboard
    wl-clip-persist # Ensures clipboard contents persist after the source application exits
    cliphist # Clipboard manager for Wayland
    xdg-utils # Set of tools that assist applications with tasks like opening URLs and managing desktop entries
    wtype # Command-line tool to simulate keyboard input on Wayland
    wlrctl # Utility to control various aspects of Wayland compositors
    waybar # Customizable status bar for Wayland
    rofi-wayland # A window switcher, application launcher, and dmenu replacement for Wayland
    dunst # Customizable notification daemon
    avizo # Manages audio volume on Wayland
    wlogout # Logout menu for Wayland
    gifsicle # CLI editor for gif images
  ];
}
