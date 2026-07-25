{
  description = "NixOS infra with Proxmox and comin";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";

    comin = {
      url = "github:nlewo/comin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      comin,
      ...
    }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
      lib = nixpkgs.lib;

      mkHost =
        hostPath:
        lib.nixosSystem {
          inherit system;
          modules = [
            comin.nixosModules.comin
            hostPath
          ];
        };
    in
    {

      formatter.${system} = pkgs.nixfmt-tree;

      nixosConfigurations = {
        bootstrap = mkHost ./hosts/bootstrap/default.nix;
        ct-test = mkHost ./hosts/ct-test/default.nix;
      };

    };
}
