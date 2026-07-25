{ ... }:

{
  services.cloud-init = {
    enable = true;
    network.enable = true;
  };

  boot = {
    growPartition = true;
    initrd.availableKernelModules = [
      "uas"
      "virtio_blk"
      "virtio_pci"
    ];
    loader.grub = {
      device = "nodev";
      efiSupport = true;
      efiInstallAsRemovable = true;
    };
  };

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-label/nixos";
      autoResize = true;
      fsType = "ext4";
    };
    "/boot" = {
      device = "/dev/disk/by-label/ESP";
      fsType = "vfat";
    };
  };
  networking.useDHCP = false;

  services.qemuGuest.enable = true;

  boot.kernelParams = [ "console=ttyS0,115200n8" ];
  systemd.services."serial-getty@ttyS0".enable = true;
}
