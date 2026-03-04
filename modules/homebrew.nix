{ ... }:

{
  homebrew = {
    enable = true;

    onActivation.cleanup = "zap";

    brews = [
      "nano"
      "tree"
      "dockutil"
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
}
