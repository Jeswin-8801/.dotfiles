{
  description = "jeswins's NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    rust-overlay.url = "github:oxalica/rust-overlay";
    wezterm.url = "github:wez/wezterm?dir=nix";
    disko.url = "github:nix-community/disko";
  };

  outputs = { self, nixpkgs, disko, ... } @attrs: {
  {
    nixosConfigurations.jeswins-nix = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = attrs;
      modules = [
        disko.nixosModules.disko ./modules/main/disk-config.nix

        ./configuration.nix
        ./hardware-configuration.nix

        ./modules/main/gc.nix
        ./modules/main/internationalisation.nix
        ./modules/main/networking.nix
        ./modules/main/nix-settings.nix
        ./modules/main/nixpkgs.nix
        ./modules/main/time.nix
        ./modules/main/users.nix


        # ./modules/graphics/nvidia.nix
        ./modules/graphics/disable-nvidia.nix
        ./modules/graphics/opengl.nix


        ./modules/peripherals/bluetooth.nix
        ./modules/peripherals/printing.nix
        ./modules/peripherals/sound.nix
        ./modules/peripherals/usb.nix


        ./modules/system/auto-upgrade.nix
        ./modules/system/bootloader.nix
        ./modules/system/environment-variables.nix
        ./modules/system/linux-kernel.nix
        ./modules/system/swap.nix


        ./modules/ui/display-manager.nix
        ./modules/ui/fonts.nix
        # ./modules/ui/gnome.nix
        ./modules/ui/hyprland.nix
        ./modules/ui/screen.nix
        ./modules/ui/theme.nix


        ./modules/services/location.nix
        ./modules/services/security-services.nix
        ./modules/services/services.nix


        ./modules/security/clamav-scanner.nix
        ./modules/security/dns.nix
        # ./modules/security/fingerprint-scanner.nix
        ./modules/security/firewall.nix
        ./modules/security/mac-randomize.nix
        ./modules/security/open-ssh.nix
        # ./modules/security/vpn.nix


        ./modules/software-dev/llm.nix
        ./modules/software-dev/lsp.nix
        ./modules/software-dev/programming-languages.nix
        ./modules/software-dev/virtualisation.nix
        ./modules/software-dev/wasm.nix


        ./modules/utility/info-fetchers.nix
        ./modules/utility/utils.nix
        ./modules/utility/terminal-utils.nix
      ];
    };
  };
}
