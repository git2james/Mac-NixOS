# macOS Tahoe Nix Configuration (Apple Silicon)

Declarative macOS setup using:

- macOS 26 (Tahoe)
- Apple Silicon (aarch64-darwin)
- nix-darwin (flake-based)
- Home Manager
- Homebrew (managed declaratively)
- Microsoft 365 + Terminal tools

This repository provisions:

- Clean, fast macOS UI
- Hybrid stock Dock (non-destructive management)
- Apple-style minimal terminal prompt ()
- Colorized terminal environment (`eza`, `fastfetch`, `zsh-completions`)
- Automatic system maintenance (Garbage Collection + Optimisation)
- Fully reproducible setup

---

# Requirements

- Apple Silicon Mac (M1, M2, M3, M4+)
- Fresh macOS install (user account created)
- Administrator access
- Internet connection

---

# First-Time Setup (Fresh macOS)

### 1. Install Nix
Use the Determinate Systems installer (recommended for macOS). It automatically enables Flakes and sets up the necessary multi-user environment:
```bash
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
```
Restart your terminal after installation.

### 2. Install Homebrew
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```
**CRITICAL (Apple Silicon):** Add Homebrew to your PATH immediately:
```bash
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"
```

### 3. Clone This Repository
```bash
git clone https://github.com/git2james/Mac-NixOS.git ~/Mac-NixOS
cd ~/Mac-NixOS
```

### 4. First Activation (Bootstrap)
Run the bootstrap command to apply the configuration for the first time:
```bash
nix run nix-darwin/master -- switch --flake .#MacBook-Pro
```
*Note: If prompted about existing files in `/etc/`, follow the instructions to back them up or allow Nix to manage them.*

### 5. Post-Install: Terminal Font
After the first rebuild, set your terminal font to see the icons correctly:
1. Open **Terminal Settings** (Cmd + ,).
2. Go to **Profiles** > **Text**.
3. Change Font to **Hack Nerd Font**.

---

# Maintenance & Updates

### Daily Use
From now on, use the custom alias to keep everything (Nix, Homebrew, and Darwin) updated in one command:
```bash
update-system
```
*This command updates your flake.lock, upgrades Homebrew packages, and rebuilds your system.*

### Manual Rebuild
If you only want to apply changes you've made to your `.nix` files without updating all external packages:
```bash
rebuild
```

### Adding New Files
**Important:** Nix Flakes only "see" files that are tracked by Git. If you add a new `.nix` file, you must add it to the index before rebuilding:
```bash
git add .
rebuild
```

---

# Troubleshooting

**Icons appearing as squares?**
Ensure you have switched your Terminal font to `Hack Nerd Font` as described in Step 5.

**Dock changes not appearing?**
Nix-Darwin usually restarts the Dock automatically, but you can force it with:
```bash
killall Dock
```

**Homebrew "zap" or uninstalls?**
This config is set to `onActivation.cleanup = "none"`. If you want Nix to strictly manage only what is in your files, change this to `"zap"` in `modules/homebrew.nix`.
