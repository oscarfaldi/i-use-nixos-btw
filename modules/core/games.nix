# modules/steam.nix

{ pkgs, ... }:

{
  # Steam
  programs.steam.enable = true;

  # Gaming utilities
  # environment.systemPackages = with pkgs; [
  #   mangohud      # FPS/performance overlay
  #   gamemode      # Feral Interactive GameMode
  #   protonup-qt   # Install/manage Proton-GE versions
  #   goverlay      # GUI for MangoHud
  # ];
}
