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
      # Load Nix environment
      if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
        . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
      fi

      # Ensure system-wide Nix binaries are in the PATH
      export PATH="/run/current-system/sw/bin:$PATH"

      # Color support
      export CLICOLOR=1
      export LSCOLORS="Gxfxcxdxbxegedabagacad"
      export LESS="-R"

      # Colored completion
      zstyle ':completion:*' list-colors "''${(s.:.)LS_COLORS}"
      zstyle ':completion:*' menu select

      # Ensure Homebrew is in PATH
      if [ -d /opt/homebrew/bin ]; then
        export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"
      fi

      fc -R ~/.zsh_history

      # Show fastfetch only in interactive shells
      if [[ $- == *i* ]]; then
        fastfetch -s OS:Host:Kernel:Uptime:Packages:Shell:Display:Terminal:TerminalFont:CPU:GPU:Memory:Disk:LocalIP:Battery:PowerAdapter:Colors
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
      ls = "eza --icons --color=always --group-directories-first";
      ll = "eza -lah --icons --color=always --group-directories-first";
      tree = "eza --tree --icons";
      grep = "grep --color=auto";
      egrep = "egrep --color=auto";
      fgrep = "fgrep --color=auto";
      diff = "diff --color=auto";
      rebuild = "pushd ~/Mac-NixOS && git add -A && git commit -m 'chore: save configuration' || true && sudo darwin-rebuild switch --flake .#MacBook-Pro && git push && popd";
      update-system = "pushd ~/Mac-NixOS && git add -A && git commit -m 'chore: pre-update configuration' || true && nix flake update --commit-lock-file && brew update && brew upgrade && sudo darwin-rebuild switch --flake .#MacBook-Pro && git push && popd";
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
    fastfetch
    eza
    zsh-completions
  ];
}
