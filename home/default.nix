{ config, pkgs, ... }:

{
  imports = [
    ./files.nix
    ./shell.nix
    ./xdg.nix
    ./chromium.nix
    ./thunar.nix
  ];

  home.username = "oscarfaldi";
  home.homeDirectory = "/home/oscarfaldi";

  home.stateVersion = "25.11";

  programs.home-manager.enable = true;
}
