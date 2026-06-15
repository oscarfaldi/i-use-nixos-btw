{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    dotDir = "${config.xdg.configHome}/zsh";
  };

  programs.starship.enable = true;
}
