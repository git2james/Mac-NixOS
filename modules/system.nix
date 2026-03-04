{ config, pkgs, ... }:

{
  networking.hostName = "MacBook-Pro";

  system.primaryUser = "James";

  users.users.James = {
    home = "/Users/James";
    shell = pkgs.zsh;
  };

  ids.gids.nixbld = 350;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  nixpkgs.config.allowUnfree = true;

  system.stateVersion = 5;
}
