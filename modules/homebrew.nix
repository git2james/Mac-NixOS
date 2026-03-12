{ ... }:

{
  homebrew = {
    enable = true;

    onActivation.cleanup = "none";
    onActivation.upgrade = true;

    brews = [
      "nano"
      "tree"
      "node"
      "gemini-cli"
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
