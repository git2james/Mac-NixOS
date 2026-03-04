{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    git
    htop
    neofetch
    curl
    iperf3
  ];
}
