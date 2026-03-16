{ ... }:

{
  imports = [
    ../../modules/common.nix
    ../../modules/proxmox-lxc.nix
  ];

  services.comin.hostname = "ct-test";
}
