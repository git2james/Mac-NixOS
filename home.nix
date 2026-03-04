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

      PROMPT=' %F{cyan}%~%f > '
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
        email = "4472496+git2james@users.noreply.github.com";
      };

      init.defaultBranch = "main";

      pull.rebase = true;

      push.autoSetupRemote = true;
    };
  };

  home.packages = with pkgs; [
  ];

  home.activation.setupDock = config.lib.dag.entryAfter ["writeBoundary"] ''
    echo "Configuring Dock apps..."

    DOCKUTIL="/opt/homebrew/bin/dockutil"

    add_if_missing() {
      if ! "$DOCKUTIL" --list | grep -q "$1"; then
        "$DOCKUTIL" --add "$1" --no-restart
      fi
    }

    add_if_missing "/Applications/Microsoft Teams.app"
    add_if_missing "/Applications/Microsoft Outlook.app"
    add_if_missing "/Applications/Microsoft Excel.app"
    add_if_missing "/Applications/Microsoft Word.app"
    add_if_missing "/System/Applications/Utilities/Terminal.app"

    if ! "$DOCKUTIL" --list | grep -q "/Applications"; then
      "$DOCKUTIL" --add /Applications \
        --type folder \
        --display folder \
        --view auto \
        --section others \
        --no-restart
    fi

    /usr/bin/killall Dock || true
  '';
}
