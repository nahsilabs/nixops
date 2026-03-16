{ ... }:

{
  imports = [
    ../../modules/common.nix
    ../../modules/proxmox-lxc.nix
  ];

  networking.hostName = "ct-test";
}
