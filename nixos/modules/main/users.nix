{ pkgs, ... }:

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.jeswins = {
    isNormalUser = true;
    description = "jeswins";
    extraGroups = [ "networkmanager" "input" "wheel" "video" "audio" "tss" ];
    shell = pkgs.fish;
    packages = with pkgs; [
      spotify
      youtube-music
      discord
      telegram-desktop
      whatsapp-for-linux
      vscode
    ];
  };

  # Enable fish
  programs.fish.enable = true;

  # Change runtime directory size
  services.logind.extraConfig = "RuntimeDirectorySize=8G";
}
