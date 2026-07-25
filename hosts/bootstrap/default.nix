{ ... }:

{
  imports = [
    ../../modules/common.nix
    ../../modules/proxmox-vm.nix
  ];

  image.modules.proxmox =
    { ... }:
    {
      virtualisation.diskSize = 20 * 1024;
      environment.etc."machine-id".text = "";

      proxmox = {
        filenameSuffix = "9000-nixos-proxmox-bootstrap";
        partitionTableType = "efi";

        qemuConf = {
          bios = "ovmf";
          boot = "order=virtio0";
          cores = 2;
          memory = 2048;
          name = "nixos-proxmox-bootstrap";
          net0 = "virtio=00:00:00:00:00:00,bridge=vmbr0,firewall=0,tag=10";
          virtio0 = "workload:vm-9000-disk-0";
        };

        cloudInit.defaultStorage = "workload";
      };

    };
}
