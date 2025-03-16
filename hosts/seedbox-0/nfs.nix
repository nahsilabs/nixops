let
  nfsMount = path: remotePath: {
    device = "10.2.10.41:${remotePath}";
    fsType = "nfs4";
    options = [
      "rw"
      "hard"
      "x-systemd.automount"
      "retrans=10"
      "timeo=30"
      "noatime"
    ];
  };
in
{
  fileSystems = {
    "/mnt/video" = nfsMount "/mnt/video" "/mnt/storage/media/video";
    "/mnt/downloads" = nfsMount "/mnt/downloads" "/mnt/storage/downloads";
  };
}
