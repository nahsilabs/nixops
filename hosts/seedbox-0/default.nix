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

  systemd.network = {
    enable = true;
    networks."40-enp6s18".routes = [
      {
        routeConfig.Gateway = "10.2.14.1";
      }
    ];
  };

  networking = {
    useDHCP = false;
    useNetworkd = true;
    hostName = "seedbox-0";
    nameservers = [
      "10.2.14.2"
    ];

    interfaces = {
      enp6s18 = {
        useDHCP = false;
        ipv4 = {
          addresses = [
            {
              address = "10.2.14.189";
              prefixLength = 24;
            }
          ];
        };
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
