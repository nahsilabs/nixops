{
  pkgs,
  lib,
  system,
  ...
}:

{
  imports = [
    "${pkgs.path}/nixos/modules/profiles/qemu-guest.nix"
    "${pkgs.path}/nixos/modules/profiles/minimal.nix"
  ];

  boot = {
    supportedFilesystems = [
      "ext4"
      "xfs"
      "vfat"
      "nfs"
    ];
    growPartition = true;
    kernelParams = lib.mkForce [ ];

    loader = {
      systemd-boot = {
        enable = true;
      };
    };

    # clear /tmp on boot to get a stateless /tmp directory.
    tmp.cleanOnBoot = true;
  };

  fileSystems."/" = {
    device = "/dev/disk/by-label/nixos";
    autoResize = true;
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-label/ESP";
    fsType = "vfat";
  };

  # reduce size of the VM
  services.fstrim = {
    enable = true;
    interval = "weekly";
  };

  nixpkgs.hostPlatform = lib.mkDefault system;
}
