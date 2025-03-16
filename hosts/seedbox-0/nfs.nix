let
  nfsMount = path: remotePath: {
    device = "nfs.lan:${remotePath}";
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
  };
}
