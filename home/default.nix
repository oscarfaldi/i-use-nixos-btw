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

  # Deploy ~/.config/niri from repository source
  #
  # Source:
  #   .system/dotfiles/niri
  #
  # Target:
  #   ~/.config/niri
  #
  # Home Manager creates a symlink automatically.
  home.file.".config/niri".source =
    ../dotfiles/niri;
}
