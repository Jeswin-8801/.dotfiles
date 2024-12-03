{ config, ... }: {
  imports = [ ../../nixos/variables-config.nix ];

  config.var = {
    hostname = "jeswins-nix";
    username = "jeswins";
    configDirectory = "/home/" + config.var.username
      + "/.config/nixos"; # The path of the nixos configuration directory

    keyboardLayout = "fr";

    location = "Bangalore";
    timeZone = "Asia/Kolkata";
    defaultLocale = "en_US.UTF-8";
    extraLocale = "en_IN";

    git = {
      username = "Jeswin-8801";
      email = "jeswin.santosh@outlook.com";
    };

    autoUpgrade = false;
    autoGarbageCollector = false;

    # Choose your theme variables here
    theme = import ../../themes/var/pinky.nix;
  };
}
