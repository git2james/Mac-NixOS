{ config, pkgs, ... }:

{
  networking.hostName = "MacBook-Pro";

  system.primaryUser = "James";

  users.users.James = {
    home = "/Users/James";
    shell = pkgs.zsh;
  };

  ids.gids.nixbld = 350;

  nix.enable = false;

  # Nix-Darwin manages /etc/zshrc, so we need to add the Nix paths manually 
  # since we've disabled native nix management to avoid conflicts with Determinate.
  programs.zsh.enable = true;
  programs.zsh.enableCompletion = true;
  programs.zsh.interactiveShellInit = ''
    if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
      . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
    fi
  '';

  # nix.settings.experimental-features = [
  #   "nix-command"
  #   "flakes"
  # ];

  # Automatic Garbage Collection and Optimisation
  # nix.gc = {
  #   automatic = true;
  #   interval = { Weekday = 0; Hour = 3; Minute = 15; }; # Every Sunday at 3:15 AM
  #   options = "--delete-older-than 30d";
  # };
  # nix.optimise.automatic = true;

  nixpkgs.config.allowUnfree = true;

  system.stateVersion = 5;
}
