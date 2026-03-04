# macOS Tahoe Nix Configuration (Apple Silicon)

Declarative macOS setup using:

- macOS 26 (Tahoe)
- Apple Silicon (aarch64-darwin)
- nix-darwin (flake-based)
- Home Manager
- Homebrew (managed declaratively)
- Microsoft 365 apps required

This repository provisions:

- Clean, fast macOS UI
- Hybrid stock Dock (non-destructive management)
- Apple-style minimal terminal prompt
- Declarative Git + Zsh config
- Screenshot automation
- Dock app automation
- Fully reproducible setup

---

# Requirements

- Apple Silicon Mac
- Fresh macOS install (user account created)
- Administrator access
- Internet connection

---

# First-Time Setup (Fresh macOS)

### 1. Install Nix (Multi-User)

```
sh <(curl -L https://nixos.org/nix/install)
```
Restart your terminal after installation.
### 2. Enable Flakes (Required Once)
```
sudo mkdir -p /etc/nix
echo "experimental-features = nix-command flakes" | sudo tee /etc/nix/nix.conf
sudo launchctl kickstart -k system/org.nixos.nix-daemon
```
Verify:
```
nix config show | grep experimental-features
```
You should see:
`experimental-features = nix-command flakes`

### 3. Install Homebrew
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```
Follow any post-install instructions printed by Homebrew.

### 4. Clone This Repository
If public:
```
git clone https://github.com/git2james/Mac-NixOS.git
```
If private:
```
git clone git@github.com:git2james/Mac-NixOS.git
```
Then:
```
cd Mac-NixOS
```
### 5. First Activation (Bootstrap nix-darwin)
```
sudo nix --extra-experimental-features "nix-command flakes" \
  run nix-darwin/master#darwin-rebuild -- \
  switch --flake .#MacBook-Pro
```
During this step:
- `/etc` becomes managed by `nix-darwin`
- Homebrew apps install
- Microsoft 365 installs
- Dock apps are added
- UI defaults apply

### 6. From Now On
Rebuild with:
```
sudo darwin-rebuild switch --flake .#MacBook-Pro
```
## Updating Configuration
After editing any .nix file:
```
git add .
git commit -m "Describe change"
sudo darwin-rebuild switch --flake .#MacBook-Pro
```
## Troubleshooting
Dock Changes Not Applying
```
killall Dock
```
Homebrew Tools Not Found
Open a new terminal window.

Flake Errors About Missing Files
Ensure all files are committed before rebuilding:
git status
Flakes only see committed files.
