{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    slack
    gnumake
    cmake
  ];
}
