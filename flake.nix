{
  description = "macOS nix configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    
    darwin.url = "github:LnL7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nixpkgs, darwin, home-manager, ... }:
  let
    system = "aarch64-darwin";
  in
  {
    darwinConfigurations."MacBook-Pro" =
      darwin.lib.darwinSystem {

        inherit system;

	modules = [
  	  ./darwin-configuration.nix

	  home-manager.darwinModules.home-manager

	  {
	    home-manager.useGlobalPkgs = true;
	    home-manager.useUserPackages = true;

	    home-manager.users.James = import ./home.nix;
	  }
	];
      };
  };
}
