{ config, pkgs, ... }:

{
  home.stateVersion = "24.11";

  programs.home-manager.enable = true;

  home.file."Downloads/Screenshots/.keep".text = "";

  programs.zsh = {
    enable = true;

    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    initContent = ''
      # Ensure Homebrew is in PATH
      if [ -d /opt/homebrew/bin ]; then
        export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"
      fi
    '';

    history = {
      size = 10000;
      save = 10000;
      path = "$HOME/.zsh_history";
      ignoreDups = true;
      share = true;
    };

    shellAliases = {
      ll = "ls -la";
      rebuild = "sudo darwin-rebuild switch --flake ~/Mac-NixOS#MacBook-Pro";
    };
  };

  programs.git = {
    enable = true;

    settings = {
      user = {
        name = "James Joy";
        email = "james.joy@mac.com";
      };

      init = {
        defaultBranch = "main";
      };

      pull = {
        rebase = true;
      };

      push = {
        autoSetupRemote = true;
      };
    };
  };

  home.packages = with pkgs; [
  ];

  home.activation.setupDock = config.lib.dag.entryAfter ["writeBoundary"] ''
    echo "Configuring Dock apps..."

    DOCKUTIL="/opt/homebrew/bin/dockutil"

    add_if_missing() {
      APP_NAME="$(basename "$1" .app)"
      if ! "$DOCKUTIL" --list | grep -q "$APP_NAME"; then
        "$DOCKUTIL" --add "$1" --no-restart
      fi
    }

    add_if_missing "/Applications/Microsoft Teams.app"
    add_if_missing "/Applications/Microsoft Outlook.app"
    add_if_missing "/Applications/Microsoft Excel.app"
    add_if_missing "/Applications/Microsoft Word.app"

    if ! "$DOCKUTIL" --list | grep -q "Applications"; then
      "$DOCKUTIL" --add /Applications --view grid --display folder --no-restart
    fi

    killall Dock || true
  '';

}
