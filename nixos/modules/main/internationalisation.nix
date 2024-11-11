{ pkgs, ... }:

{
  # Configure keymap
  services.xserver = {
    xkb.layout = "us";
    xkb.options = "grp:alt_shift_toggle";
  };
  
  i18n.supportedLocales = [
    "en_US.UTF-8/UTF-8"
    "uk_UA.UTF-8/UTF-8"
  ];
  
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_IN";
    LC_IDENTIFICATION = "en_IN";
    LC_MEASUREMENT = "en_IN";
    LC_MONETARY = "en_IN";
    LC_NAME = "en_IN";
    LC_NUMERIC = "en_IN";
    LC_PAPER = "en_IN";
    LC_TELEPHONE = "en_IN";
    LC_TIME = "en_IN";
  };

  environment.systemPackages = with pkgs; [
    nuspell
    hyphen
    hunspell
    hunspellDicts.en_US
    hunspellDicts.uk_UA
  ];
}
