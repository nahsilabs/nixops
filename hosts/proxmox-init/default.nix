_:

{
  imports = [
    ../hardware-configuration.nix

    # system modules
    ../../system/nixos.nix
    ../../system/users.nix
    ../../system/services.nix
    ../../system/packages.nix
    ../../system/internalisation.nix
  ];

  networking.hostName = (import ../../vars.nix).hostname;
}
