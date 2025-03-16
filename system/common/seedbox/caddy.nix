{
  networking.firewall.allowedTCPPorts = [
    80
    443
  ];

  services.caddy = {
    enable = true;
    email = "nahsi@nahsi.dev";
    virtualHosts."torrent.nahsi.dev".extraConfig = ''
      reverse_proxy http://localhost:8080
      tls /var/lib/acme/torrent.nahsi.dev/cert.pem /var/lib/acme/torrent.nahsi.dev/key.pem {
        protocols tls1.3
      }
    '';
    globalConfig = ''
      admin off
    '';
  };

  systemd.services.caddy.serviceConfig = {
    DynamicUser = false;
    PrivateUsers = false;
    SystemCallFilter = [
      "@system-service"
      "~@resources"
    ];
    CapabilityBoundingSet = [ "CAP_NET_BIND_SERVICE" ];
    AmbientCapabilities = [ "CAP_NET_BIND_SERVICE" ];
    SocketBindDeny = "any";
    SocketBindAllow = [
      443
      80
    ];
  };
}
