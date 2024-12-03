# Edit trueconfiguration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:
  let
    # Get the current directory as a string
    pwd = toString ../../nixos/modules;
    
    mainModulePaths = builtins.map (file: "${pwd}/main/${file}") (builtins.attrNames (builtins.readDir "${pwd}/main"));
    graphicsModulePaths = builtins.map (file: "${pwd}/graphics/${file}") (builtins.attrNames (builtins.readDir "${pwd}/graphics"));
    peripheralsModulePaths = builtins.map (file: "${pwd}/peripherals/${file}") (builtins.attrNames (builtins.readDir "${pwd}/peripherals"));
    securityModulePaths = builtins.map (file: "${pwd}/security/${file}") (builtins.attrNames (builtins.readDir "${pwd}/security"));
    servicesModulePaths = builtins.map (file: "${pwd}/services/${file}") (builtins.attrNames (builtins.readDir "${pwd}/services"));
    systemModulePaths = builtins.map (file: "${pwd}/system/${file}") (builtins.attrNames (builtins.readDir "${pwd}/system"));
    uiModulePaths = builtins.map (file: "${pwd}/ui/${file}") (builtins.attrNames (builtins.readDir "${pwd}/ui"));
  in {

    # Global Configurations
    imports = [
      # Choose your theme here
      ../../themes/stylix/pinky.nix
  
      ./hardware-configuration.nix
      ./variables.nix
      
    ] ++ mainModulePaths ++ graphicsModulePaths ++ peripheralsModulePaths ++ securityModulePaths ++ servicesModulePaths ++ systemModulePaths ++ uiModulePaths;

    home-manager.users."${config.var.username}" = import ./home.nix;

    # This value determines the NixOS release from which the default
    # settings for stateful data, like file locations and database versions
    # on your system were taken. It‘s perfectly fine and recommended to leave
    # this value at the release version of the first install of this system.
    # Before changing this value read the documentation for this option
    # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
    system.stateVersion = "24.05";

  }
