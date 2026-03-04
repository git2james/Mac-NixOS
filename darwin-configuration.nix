{ config, pkgs, ... }:

{

  system.primaryUser = "James";

  services.nix-daemon.enable = true;

  ids.gids.nixbld = 350;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  users.users.James = {
    home = "/Users/James";
    shell = pkgs.zsh;
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    git
    htop
    neofetch
    curl
    iperf3
  ];

  system.defaults.finder.AppleShowAllExtensions = true;
  system.defaults.NSGlobalDomain.AppleShowAllExtensions = true;
#  system.defaults.dock.AppleShowAllExtensions = true;

  homebrew = {
    enable = true;
    onActivation.cleanup = "zap";

    brews = [
      "nano"
      "tree"
    ];

    casks = [
      "visual-studio-code"
      "shottr"
      "vlc"
      "microsoft-office"
      "microsoft-teams"
      "microsoft-azure-storage-explorer"
    ];
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  security.pam.services.sudo_local.touchIdAuth = true;

  environment.etc."terminal/Homebrew.terminal".source =
    ./dotfiles/Homebrew.terminal;

  system.defaults.CustomUserPreferences = {
    "com.apple.Terminal" = {
      "Default Window Settings" = "Homebrew";
      "Startup Window Settings" = "Homebrew";
    };
  };

  system.stateVersion = 5;

}
