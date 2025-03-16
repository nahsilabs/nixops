{ lib, ... }:

{
  # enable openssh
  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
      PermitRootLogin = lib.mkForce "prohibit-password"; # enable root login for remote deploy
    };
  };

  # enable qemu-guest-agent
  services.qemuGuest.enable = true;

  # pull configuration from a repo
  services.comin = {
    enable = true;
    remotes = [
      {
        name = "origin";
        url = "https://github.com/nahsilabs/nixops.git";
        branches.main.name = "master";
      }
    ];
  };
}
