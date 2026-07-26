{ pkgs, ... }:

{
  imports = [
    ../../modules/common.nix
    ../../modules/proxmox-lxc.nix
  ];

  nix.settings.trusted-users = [
    "root"
    "nahsi"
  ];

  age = {
    identityPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];
    secrets.ragenix-proof = {
      file = ../../secrets/ragenix-proof.age;
      path = "/run/agenix/ragenix-proof";
      owner = "root";
      group = "root";
      mode = "0400";
    };
  };

  services.comin = {
    enable = true;
    hostname = "ct-test";
    machineId = "ed5a1ec9b03649f79d251ead18eff1a8";
    sshAllowedSignersPath = "${pkgs.writeText "comin-allowed-signers" ''
      nahsi namespaces="git" ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILd/6tTC0ZiExgsuvZnJzF32mjFVJBRwZDcUuKb3d5ia
    ''}";
    remotes = [
      {
        name = "origin";
        url = "https://github.com/nahsilabs/nixops.git";
        branches = {
          main = {
            name = "refactor";
            operation = "switch";
          };
          testing = {
            name = "testing-ct-test";
            operation = "test";
          };
        };
      }
    ];
  };
}
