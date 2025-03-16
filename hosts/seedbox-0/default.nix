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
    ../../system/qbittorrent.nix
  ];

  networking.hostName = "seedbox-0";

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
