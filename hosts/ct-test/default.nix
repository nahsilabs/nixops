{ pkgs, ... }:

{
  imports = [
    ../../modules/common.nix
    ../../modules/proxmox-lxc.nix
  ];

  services.comin = {
    enable = true;
    hostname = "ct-test";
    remotes = [
      {
        name = "origin";
        url = "https://github.com/nahsilabs/nixops.git";
        branches.main.name = "refactor";
      }
    ];
  };
  environment.systemPackages = with pkgs; [
    vllm
  ];
}
