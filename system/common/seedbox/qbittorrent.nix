{
  networking.firewall.allowedTCPPorts = [
    39604
  ];

  users.groups.qbittorrent = { };
  users.users = {
    qbittorrent = {
      isSystemUser = true;
      group = "qbittorrent";
      extraGroups = [
        "nogroup"
      ];
    };
  };

  services.qbittorrent = {
    enable = true;
    webuiPort = 8080;
    torrentingPort = 39604;
    settings = {
      LegalNotice.Accepted = true;
      Application = {
        MemoryWorkingSetLimit = 3072;
      };
      BitTorrent.Session = {
        Interface = "enp6s18";
        Encryption = 1;
        PieceExtentAffinity = true;
        SuggestMode = true;
        PerformanceWarning = false;

        BandwidthSchedulerEnabled = true;
        UseAlternativeGlobalSpeedLimit = true;
        GlobalDLSpeedLimit = 32000;
        GlobalUPSpeedLimit = 32000;
        AlternativeGlobalDLSpeedLimit = 18000;
        AlternativeGlobalUPSpeedLimit = 18000;

        FilePoolSize = 100;
        MaxActiveCheckingTorrents = 4;
        MaxActiveDownloads = 1;
        MaxActiveTorrents = 500;
        MaxActiveUploads = 50;
        MaxConnections = 1000;
        MaxUploads = 100;
        MaxUploadsPerTorrent = 5;

        AsyncIOThreadsCount = 16;
        HashingThreadsCount = 4;
        CheckingMemUsageSize = 128;

        CoalesceReadWrite = true;
        DiskCacheSize = 2048;
        DiskQueueSize = 268435456;
        DiskIOReadMode = "EnableOSCache";
        DiskIOType = "Default";
        DiskIOWriteMode = "DisableOSCache";

        TempPath = "/mnt/incomplete";
        TempPathEnabled = true;
      };

      Preferences = {
        Advanced.RecheckOnCompletion = false;
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
