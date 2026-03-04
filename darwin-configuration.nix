{ ... }:

{
  imports = [
    ./modules/system.nix
    ./modules/packages.nix
    ./modules/homebrew.nix
    ./modules/defaults.nix
    ./modules/security.nix
  ];
}
