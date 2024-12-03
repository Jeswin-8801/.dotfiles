{ config, pkgs, ... }:
  let username = config.var.username;
in {

  # Define a user account. Don't forget to set a password with ‘passwd’.

  users = {
    defaultUserShell = pkgs.fish;
    users.${username} = {
      isNormalUser = true;
      description = "${username} account";
      extraGroups = [ "networkmanager" "input" "wheel" "video" "audio" "tss" ];
    };
  };

  # Enable fish
  programs.fish.enable = true;

  # Change runtime directory size
  services.logind.extraConfig = "RuntimeDirectorySize=8G";
}