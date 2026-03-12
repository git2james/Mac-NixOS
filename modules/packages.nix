{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    git
    htop
    neofetch
    curl
    iperf3
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.hack
  ];
}
