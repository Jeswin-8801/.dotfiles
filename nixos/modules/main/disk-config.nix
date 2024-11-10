{
  disko.devices = {
    disk = {
      main = {
        device = "/dev/sda";
        type = "disk";
        content = {
          type = "gpt";
          partitions = {
            ESP = {
              end = "500M";
              type = "EF00";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
              };
            };
            swap = {
              name = "swap";
              start = "500M";
              end = "4.5G";
              type = "8200";
              content = {
                type = "swap";
              };
            };
            root = {
              name = "root";
              start = "4.5G";
              end = "54.5G";
              content = {
                type = "filesystem";
                format = "ext4";
                mountpoint = "/";
              };
            };
            home = {
              name = "home";
              start = "54.5G";
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
