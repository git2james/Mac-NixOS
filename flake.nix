{
  description = "macOS nix configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    
    darwin.url = "github:LnL7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nixpkgs, darwin }:
  let
    system = "aarch64-darwin";
  in
  {
    darwinConfigurations."MacBook-Pro" =
      darwin.lib.darwinSystem {

        inherit system;

        modules = [
          ./darwin-configuration.nix
        ];
      };
  };
}
