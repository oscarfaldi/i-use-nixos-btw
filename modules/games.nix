# modules/steam.nix

{ pkgs, ... }:

{
  # Steam configuration
  programs.steam.enable = true;

  # Gamescope (Valve's micro-compositor)
  programs.gamescope = {
    enable = true;
    capSysNice = true; # Grants process priority privileges for smoother performance and frame pacing
  };

  # Gaming utilities
  environment.systemPackages = with pkgs; [
    gamemode      # CPU/GPU performance optimization daemon
    protonup-qt   # GUI tool to install and manage custom Proton-GE versions
  ];
}
