{
  description = "jeswins's NixOS Configuration";

  inputs = {
      nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
      rust-overlay.url = "github:oxalica/rust-overlay";
      wezterm.url = "github:wez/wezterm?dir=nix";
      disko.url = "github:nix-community/disko";
  };

  outputs = { nixpkgs, ... } @ inputs:
  {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      modules = [
        ./configuration.nix
        ./hardware-configuration.nix

        ./modules/main/time.nix
        ./modules/main/internationalisation.nix
        ./modules/main/nix-settings.nix
        ./modules/main/nixpkgs.nix
        ./modules/main/gc.nix
        ./modules/main/users.nix
        ./modules/main/networking.nix

        disko.nixosModules.disko
        ./modules/main/disk-config.nix

        # ./modules/nvidia.nix
        ./modules/disable-nvidia.nix
        ./modules/opengl.nix

        ./modules/sound.nix
        ./modules/usb.nix
        ./modules/bluetooth.nix
        ./modules/location.nix
        ./modules/printing.nix
     
        ./modules/swap.nix
        ./modules/bootloader.nix
        ./modules/auto-upgrade.nix
        ./modules/linux-kernel.nix
        ./modules/environment-variables.nix

        ./modules/screen.nix
        ./modules/display-manager.nix
        ./modules/theme.nix
        ./modules/fonts.nix

        ./modules/security-services.nix
        ./modules/services.nix

        # ./modules/gnome.nix
        ./modules/hyprland.nix

        # ./modules/fingerprint-scanner.nix
        ./modules/clamav-scanner.nix
        ./modules/mac-randomize.nix
        ./modules/open-ssh.nix
        ./modules/firewall.nix
        ./modules/dns.nix
        # ./modules/vpn.nix
   
        ./modules/virtualisation.nix
        ./modules/programming-languages.nix
        ./modules/lsp.nix
        ./modules/wasm.nix    
        ./modules/llm.nix

        ./modules/info-fetchers.nix
        ./modules/utils.nix
        ./modules/terminal-utils.nix
      ];
    };
  };
}
