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
  programs.fish.enable = true;
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
}
