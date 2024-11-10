{ pkgs, ... }:

{
  # Select internationalisation properties.
  services.xserver = {
    xkb.layout = "us,ua";
    xkb.options = "grp:alt_shift_toggle";
  };
  
  i18n.supportedLocales = [
    "en_US.UTF-8/UTF-8"
    "en_IN.UTF-8/UTF-8"
    "uk_UA.UTF-8/UTF-8"
  ];
  
  i18n.defaultLocale = "en_IN.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_IN.UTF-8";
    LC_IDENTIFICATION = "en_IN.UTF-8";
    LC_MEASUREMENT = "en_IN.UTF-8";
    LC_MONETARY = "en_IN.UTF-8";
    LC_NAME = "en_IN.UTF-8";
    LC_NUMERIC = "en_IN.UTF-8";
    LC_PAPER = "en_IN.UTF-8";
    LC_TELEPHONE = "en_IN.UTF-8";
    LC_TIME = "en_IN.UTF-8";
  };

  environment.systemPackages = with pkgs; [
    nuspell
    hyphen
    hunspell
    hunspellDicts.en_US
    hunspellDicts.uk_UA
  ];
}
