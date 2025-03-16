{
  networking.firewall.allowedTCPPorts = [
    39604
  ];

  services.qbittorrent = {
    enable = true;
    webuiPort = 8080;
    torrentingPort = 39604;
    settings = {
      LegalNotice.Accepted = true;
      Preferences = {
        Downloads.SavePath = "/mnt/downloads";
        WebUI = {
          Username = "nahsi";
          Address = "*";
          Port = 8080;
          Password_PBKDF2 = "@ByteArray(8gEQCzX/Vsdm07R5eTZotg==:6MUErmZhLsqrQDlXFjJjRv1vPW091L2GUelI7Kd9a8j8mGXatyLThGszBryaAq6rYoHMzMJMeKj4BvVm8LKZRw==)";
          ReverseProxySupportEnabled = true;
          ServerDomains = "torrent.nahsi.dev";
        };
      };
    };
    user = "nobody";
    group = "nobody";
  };
}
