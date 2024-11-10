{ pkgs, ... }:

{
  # Enable Docker
  virtualisation.docker.enable = true;
  virtualisation.docker.rootless = {
    enable = true;
    setSocketVariable = true;
  };
  users.extraGroups.docker.members = [ "jeswins" ];

  environment.systemPackages = with pkgs; [
    distrobox
    qemu

    lazydocker
    docker-credential-helpers
  ];
}