{ config, pkgs, ... }:

{
  imports = [
    ./files.nix
    ./mako.nix
    ./waybar.nix
    ./fuzzel.nix
    ./shell.nix
    ./xdg.nix
    ./chromium.nix
    ./ghostty.nix
    ./thunar.nix
    ./theme-gruvbox.nix
    ./starship.nix
    ./onlyoffice.nix
  ];

  home.username = "oscarfaldi";
  home.homeDirectory = "/home/oscarfaldi";

  home.stateVersion = "25.11";

  programs.home-manager.enable = true;
}
