# Project Context: Mac-NixOS

This project manages a macOS 26 Tahoe configuration using `nix-darwin` and `home-manager` with Flakes.

## System Environment
- **OS:** macOS 26 Tahoe
- **Architecture:** `aarch64-darwin` (Apple Silicon)
- **Primary User:** `James`
- **Rebuild Command:** `sudo darwin-rebuild switch --flake .#MacBook-Pro`
- **Update Command:** `update-system` (Alias for flake update + rebuild)

## Configuration Mandates

### Dock Management
- **Declarative Only:** Always use native `nix-darwin` options (`system.defaults.dock.persistent-apps` and `persistent-others`). Do **not** use `dockutil` or imperative activation scripts for Dock items.
- **Base Template:** Use the default macOS 26 Tahoe app set as the foundation (including the new "Apps" launcher and "Phone" app).
- **Specific Additions:** 
  - Microsoft Office: Teams, Outlook, Excel, Word.
  - Utilities: Terminal.
- **Specific Exclusions:** Always remove "Freeform", "News", and "Games".
- **Folder Preferences:**
  - `Applications`: Display as **folder**, open as **grid**.
  - `Downloads`: Display as **folder**, open as **list**.

### Activation & Defaults
- **Immediate Application:** Use `system.activationScripts.activateSettings` to trigger `/System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u`.
- **Permissions:** This script must run as the primary user via `sudo -u ${config.system.primaryUser}` to correctly update user defaults.

## Established Configuration Reference

### System & Security
- **Hostname:** `MacBook-Pro`
- **Touch ID:** Enabled for `sudo` in terminal (`security.pam.services.sudo_local.touchIdAuth`).
- **Nix Features:** `nix-command`, `flakes` enabled; `allowUnfree = true`.
- **Maintenance:** Automatic weekly garbage collection (Sundays at 3:15 AM) and store optimization enabled.
- **Screensaver:** Password required after 5 seconds.

### macOS UI Preferences (`modules/ui.nix`)
- **Finder:**
  - Show all extensions, path bar, and status bar.
  - Default view style: List (`Nlsv`).
  - Sort folders first.
  - Show hard drives, servers, and removable media on desktop.
- **Dock:**
  - Autohide enabled (0.0s delay, 0.1s modifier).
  - Tilesize: 48.
  - Show recents and process indicators enabled.
  - Hot corner (Bottom Right): Mission Control (`10`).
- **Trackpad:**
  - Tap-to-click, right-click, and dragging enabled.
  - Scaling/Speed: 2.5.
- **Global Behaviors:**
  - Temperature: Celsius.
  - Automatic capitalization/period/dash/spelling correction: Disabled.
  - 12-hour clock with AM/PM and date/day of week shown.
  - Screenshots: Saved to `~/Downloads/Screenshots` as `.png`.
  - Network/USB Stores: `.DS_Store` writing disabled.

### Software Stack
- **System Packages (Nix):** `git`, `htop`, `fastfetch`, `curl`, `iperf3`.
- **Fonts:** `nerd-fonts.hack` (Hack Nerd Font) installed via `fonts.packages`.
- **Homebrew Configuration:** `onActivation.cleanup = "none"`, `onActivation.upgrade = true`.
- **Homebrew Brews:** `nano`, `tree`, `node`, `gemini-cli`.
- **Homebrew Casks:** `visual-studio-code`, `shottr`, `vlc`, `microsoft-office`, `microsoft-teams`, `microsoft-azure-storage-explorer`.

### Shell & Git (`home.nix`)
- **Zsh:**
    - **Color Support:** `CLICOLOR=1`, `LSCOLORS` configured, `LESS="-R"` for pager colors.
    - **Completions:** `zsh-completions` package, colorized menu selection enabled.
    - **Modern Tools:** `eza` for colorized/icon-based `ls`, `fastfetch` for system info summary (customized modules).
    - **Prompt:** ` %F{cyan}%~%f > `.
    - **Aliases:** 
      - `ls`: `eza` with icons and colors.
      - `ll`: Long list `eza`.
      - `tree`: Tree view `eza`.
      - `update-system`: Automates `flake update` and `darwin-rebuild`.
      - `rebuild`: standard darwin-rebuild switch.
- **Git:**
  - User: `James Joy` (`4472496+git2james@users.noreply.github.com`).
  - Defaults: `main` branch, auto-setup remote, rebase on pull.

## Workspace Conventions
- **Modular Structure:** Keep system-level UI, security, and package settings in the `modules/` directory.
- **Home Manager:** Use `home.nix` for user-specific CLI tools, shell aliases, and git configuration.
- **Context Maintenance:** Always keep `GEMINI.md` updated with the latest architectural changes, package additions, and operational procedures to ensure full context for future AI sessions.
- **No Staging:** Do not stage or commit changes unless explicitly requested.
