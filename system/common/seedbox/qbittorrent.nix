{
  networking.firewall.allowedTCPPorts = [
    39604
  ];

  users.groups.qbittorrent = { };
  users.users = {
    qbittorrent = {
      isSystemUser = true;
      group = "qbittorrent";
    };
  };

  services.qbittorrent = {
    enable = true;
    webuiPort = 8080;
    torrentingPort = 39604;
    settings = {
      LegalNotice.Accepted = true;
      Application = {
        MemoryWorkingSetLimit = 1024;
      };
      BitTorrent.Session = {
        Interface = "eth0";
        AsyncIOThreadsCount = 16;
        Encryption = 1;
        HashingThreadsCount = 4;
        CheckingMemUsageSize = 128;
        PieceExtentAffinity = true;
        SuggestMode = true;

        BandwidthSchedulerEnabled = true;
        UseAlternativeGlobalSpeedLimit = true;
        GlobalDLSpeedLimit = 32000;
        GlobalUPSpeedLimit = 32000;
        AlternativeGlobalDLSpeedLimit = 18000;
        AlternativeGlobalUPSpeedLimit = 18000;

        CoalesceReadWrite = true;
        DiskCacheSize = 1024;
        DiskIOReadMode = "EnableOSCache";
        DiskIOType = "Default";
        DiskIOWriteMode = "DisableOSCache";

        TempPath = "/mnt/incomplete";
        TempPathEnabled = true;
      };

      Preferences = {
        Advanced.RecheckOnCompletion = true;
        Downloads.SavePath = "/mnt/downloads";
        WebUI = {
          Username = "nahsi";
          Address = "*";
          Port = 8080;
          Password_PBKDF2 = "@ByteArray(8gEQCzX/Vsdm07R5eTZotg==:6MUErmZhLsqrQDlXFjJjRv1vPW091L2GUelI7Kd9a8j8mGXatyLThGszBryaAq6rYoHMzMJMeKj4BvVm8LKZRw==)";
          ServerDomains = "torrent.nahsi.dev";
        };
      };
    };
    user = "qbittorrent";
    group = "qbittorrent";
  };
}
