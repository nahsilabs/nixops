{ pkgs, ... }:

{
  time.timeZone = "Europe/Athens";

  environment.systemPackages = with pkgs; [
    git
    curl
    btop
    lsof
    iproute2
    inetutils
    dnsutils
    jq
    ripgrep
    tree
    screen
  ];

  users.mutableUsers = false;

  users.users.admin = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    users.users.admin.openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILd/6tTC0ZiExgsuvZnJzF32mjFVJBRwZDcUuKb3d5ia nahsi@framework"
    ];
  };

  security.sudo = {
    enable = true;
    wheelNeedsPassword = false;
  };

  services.openssh = {
    enable = true;
    openFirewall = true;

    settings = {
      PubkeyAuthentication = true;
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
      PermitRootLogin = "no";
    };
  };

  services.comin = {
    enable = true;

    remotes = [
      {
        name = "origin";
        url = "https://github.com/nahsilabs/nixops.git";
        branches.main.name = "refactor";
      }
    ];
  };

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  system.stateVersion = "25.11";
}
