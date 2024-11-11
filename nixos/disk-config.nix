{
  disko.devices = {
    disk = {
      main = {
        device = "/dev/sda"; # Replace with your actual disk
        type = "disk";
        content = {
          type = "gpt"; # GPT partition table
          partitions = {
            ESP = {
              name = "boot";
              type = "EF00"; # EFI System Partition
              size = "1G";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot"; # Mount point for EFI
              };
            };
            swap = {
              name = "swap";
              size = "4G";
              type = "8200";
              content = {
                type = "swap";
              };
            };
            root = {
              name = "root";
              size = "50G";
              content = {
                type = "filesystem";
                format = "ext4";
                mountpoint = "/";
              };
            };
            home = {
              name = "home";
              size = "100%";
              end = "-0";
              content = {
                type = "filesystem";
                format = "ext4";
                mountpoint = "/home";
              };
            };
          };
        };
      };
    };
  };
}
