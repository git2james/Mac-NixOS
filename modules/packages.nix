{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    git
    htop
    fastfetch
    curl
    iperf3
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.hack
  ];
}
