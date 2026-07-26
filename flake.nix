{
  description = "NixOS infra with Proxmox and comin";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";

    comin = {
      url = "github:nlewo/comin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    ragenix = {
      url = "github:yaxitech/ragenix/83bccfdea758241999f32869fb6b36f7ac72f1ac";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      comin,
      ragenix,
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
            ragenix.nixosModules.age
            hostPath
          ];
        };
    in
    {

      formatter.${system} = pkgs.nixfmt-tree;

      nixosConfigurations = {
        bootstrap = mkHost ./hosts/bootstrap/default.nix;
        ct-test = mkHost ./hosts/ct-test/default.nix;
        lxc-bootstrap-prototype = mkHost ./hosts/lxc-bootstrap-prototype/default.nix;
      };

    };
}
