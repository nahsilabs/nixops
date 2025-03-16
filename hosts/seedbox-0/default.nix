{
  imports = [
    ../hardware-configuration.nix
    ./nfs.nix

    # system modules
    ../../system/nixos.nix
    ../../system/users.nix
    ../../system/services.nix
    ../../system/packages.nix
    ../../system/internalisation.nix
    ../../system/common/seedbox
  ];

  networking = {
    hostName = "seedbox-0";
    nameservers = [
      "1.1.1.1"
      "9.9.9.9"
    ];

    defaultGateway = {
      address = "37.98.199.179";
      interface = "enp6s18";
    };
    interfaces = {
      enp6s18 = {
        useDHCP = false;
        ipv4.addresses = [
          {
            address = "37.98.199.189";
            prefixLength = 32;
          }
        ];
      };
      enp6s19 = {
        useDHCP = false;
        ipv4.addresses = [
          {
            address = "10.2.10.9";
            prefixLength = 24;
          }
        ];
      };
    };
  };

  # pull configuration from a repo
  services.comin = {
    enable = true;
    remotes = [
      {
        name = "origin";
        url = "https://github.com/nahsilabs/nixops.git";
        branches.main.name = "master";
      }
    ];
  };
}
