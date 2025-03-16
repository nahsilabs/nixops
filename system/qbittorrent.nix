{
  services.qbittorrent = {
    enable = true;
    webuiPort = 8080;
    torrentingPort = 39604;
    settings = {
      LegalNotice.Accepted = true;
      Preferences = {
        Downloads.SavePath = "/mnt/downloads";
        WebUI = {
          Username = "admin";
        };
      };
    };
    user = "nobody";
    group = "nobody";
  };
}
