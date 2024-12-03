{ pkgs, ... }: {

  environment.systemPackages = with pkgs; [
    blueman
    overskride
  ];

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  services.blueman.enable = true;  
}
