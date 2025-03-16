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
}
