{ modulesPath, ... }:

{
  imports = [
    (modulesPath + "/virtualisation/proxmox-lxc.nix")
  ];

  boot.isContainer = true;

  proxmoxLXC = {
    manageNetwork = false;
    manageHostName = false;
    privileged = false;
  };

  services.fstrim.enable = false;
  systemd.suppressedSystemUnits = [
    "dev-mqueue.mount"
    "sys-kernel-debug.mount"
    "sys-fs-fuse-connections.mount"
  ];
  systemd.network.wait-online.enable = false;
}
