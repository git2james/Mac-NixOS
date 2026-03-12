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

  # Automatic Garbage Collection and Optimisation
  nix.gc = {
    automatic = true;
    interval = { Weekday = 0; Hour = 3; Minute = 15; }; # Every Sunday at 3:15 AM
    options = "--delete-older-than 30d";
  };
  nix.optimise.automatic = true;

  nixpkgs.config.allowUnfree = true;

  system.stateVersion = 5;
}
