# Edit trueconfiguration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:
  let
    # Get the current directory as a string
    pwd = toString ./.;
    # get all paths to modules in ./modules/main/
    modulePaths = builtins.map (file: "${pwd}/modules/main/${file}") (builtins.attrNames (builtins.readDir "${pwd}/modules/main"));
  in {

    # Global Configurations
    imports = [
      ./hardware-configuration.nix

      ./modules/system/bootloader.nix
      ./modules/system/linux-kernel.nix

    ] ++ modulePaths;

    # This value determines the NixOS release from which the default
    # settings for stateful data, like file locations and database versions
    # on your system were taken. It‘s perfectly fine and recommended to leave
    # this value at the release version of the first install of this system.
    # Before changing this value read the documentation for this option
    # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
    system.stateVersion = "your_version";

  }
