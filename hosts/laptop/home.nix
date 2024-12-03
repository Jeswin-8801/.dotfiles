{ pkgs, config, ... }: {

  imports = [
    ./variables.nix

    # Programs
    ../../home/programs/kitty
    ../../home/programs/nvim
    ../../home/programs/qutebrowser
    ../../home/programs/shell
    ../../home/programs/fetch
    ../../home/programs/git
    ../../home/programs/spicetify
    ../../home/programs/nextcloud
    ../../home/programs/yazi
    ../../home/programs/markdown
    ../../home/programs/thunar
    ../../home/programs/lazygit
    ../../home/programs/nh
    ../../home/programs/firefox
    ../../home/programs/server-page

    # Scripts
    ../../home/scripts # All scripts

    # System (Desktop environment like stuff)
    ../../home/system/hyprland
    ../../home/system/hypridle
    ../../home/system/hyprlock
    ../../home/system/hyprpanel
    ../../home/system/hyprpaper
    ../../home/system/gtk
    ../../home/system/wofi
    ../../home/system/batsignal
    ../../home/system/zathura
    ../../home/system/mime
    ../../home/system/udiskie
    ../../home/system/clipman
    ../../home/system/tofi

    ./secrets # CHANGEME: You should probably remove this line, this is where I store my secrets
  ];

  home = {
    inherit (config.var) username;
    homeDirectory = "/home/" + config.var.username;

    packages = with pkgs; [
      # Apps
      discord # Chat
      telegram-desktop
      whatsapp-for-linux
      vlc # Video player
      blanket # White-noise app

      # Dev
      go
      nodejs
      python3
      figlet
      just

      # Utils
      zip
      unzip
      optipng
      pandoc

      # Just cool
      peaclock
      cbonsai
      cmatrix
      pipes-rs
      rsclock
      cava

      # Backup
      vscode

      qt6.qtwayland # Allows Qt applications to run as clients on a Wayland display server
      grim # Tool for taking screenshots on Wayland compositors
      slurp # Allows you to select a region of the screen interactively, often used with grim
      imagemagick # A suite for displaying, converting, and editing raster and vector image files
      ffmpeg # Comprehensive multimedia framework for recording, converting, and streaming audio and video
      wl-clipboard # Provides command-line tools to interact with the Wayland clipboard
      wl-clip-persist # Ensures clipboard contents persist after the source application exits
      cliphist # Clipboard manager for Wayland
      wlrctl # Utility to control various aspects of Wayland compositors
      waybar # Customizable status bar for Wayland
      rofi-wayland # A window switcher, application launcher, and dmenu replacement for Wayland

      neovim
      file
      upx
      git
      lazygit
      delta
      license-generator
      git-ignore
      gitleaks
      git-secrets
      pass-git-helper
      xh
      process-compose
      # mcfly # terminal history
      zellij
      progress
      noti
      topgrade
      ripgrep
      rewrk
      wrk2
      procs
      tealdeer
      # skim # better alternative to fzf in rust
      monolith
      aria
      # macchina #neofetch alternative in rust
      sd
      ouch
      duf
      du-dust
      fd
      jq
      gh
      trash-cli
      zoxide
      tokei
      fzf
      bat
      hexyl
      mdcat
      lsd
      lsof
      gping
      viu
      tre-command
      yazi
      chafa

      # Info Fetchers
      neofetch
      onefetch
      ipfetch
      cpufetch
      ramfetch
      starfetch
      octofetch
      htop
      bottom
      btop
      zfxtop
      kmon

      # vulkan-tools
      # opencl-info
      # clinfo
      # vdpauinfo
      # libva-utils
      # nvtopPackages.nvidia
      # nvtopPackages.intel
      wlr-randr
      gpu-viewer
      dig
      speedtest-rs

    ];

    # Import my profile picture, used by the hyprpanel dashboard
    file.".profile_picture.jpg" = { source = ./profile_picture.jpg; };

    # Don't touch this
    stateVersion = "24.05";
  };

  programs.home-manager.enable = true;
}
