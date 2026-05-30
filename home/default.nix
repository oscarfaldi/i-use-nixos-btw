{ config, pkgs, ... }:

{
  # Linux username that Home Manager manages
  home.username = "oscarfaldi";

  # Home directory of the managed user
  home.homeDirectory = "/home/oscarfaldi";

  # Home Manager state version.
  # Similar to system.stateVersion in NixOS.
  # Should only be changed intentionally after reading release notes.
  home.stateVersion = "25.11";

  # Enable Home Manager itself
  programs.home-manager.enable = true;

  # Config modules for each packages
  imports = [
    ./niri.nix
    ./alacritty.nix
    ./gtk.nix
    ./screenshot.nix
    ./fastfetch.nix
    ./thunar.nix
    ./waybar.nix
    ./btop.nix
  ];
}
