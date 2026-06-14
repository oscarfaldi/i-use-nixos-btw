{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;

    initContent = ''
      source ~/.config/zshrc
    '';
  };

  programs.starship = {
    enable = true;
  };
}
