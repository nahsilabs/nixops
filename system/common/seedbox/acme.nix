{ config, ... }:
{
  security.acme = {
    acceptTerms = true;
    defaults.email = "nahsi@nahsi.dev";

    certs."torrent.nahsi.dev" = {
      group = config.services.caddy.group;

      domain = "torrent.nahsi.dev";
      dnsProvider = "cloudflare";
      dnsResolver = "1.1.1.1:53";
      dnsPropagationCheck = true;
      environmentFile = "${config.age.secrets.acme.path}";
    };
  };
}
