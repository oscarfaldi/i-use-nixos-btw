{ config, pkgs, ... }:

{
  fonts = {
    packages = with pkgs; [

      # Nerd Fonts
      nerd-fonts.iosevka
      nerd-fonts.blex-mono

      # Jetbrains Fonts
      jetbrains-mono

      # IBM Plex
      ibm-plex

      # Unicode / International
      noto-fonts
      noto-fonts-cjk-sans

      # Emoji
      noto-fonts-color-emoji

      # Optional old-school terminal feel
      inter
    ];

    fontconfig = {
      enable = true;

      defaultFonts = {

        monospace = [
          "IosevkaTermSlab Nerd Font"
          "JetBrains Mono"
          "BlexMono Nerd Font"
          "IBM Plex Mono"
          "Inter"
        ];

        sansSerif = [
          "IBM Plex Sans"
          "Noto Sans"
        ];

        serif = [
          "IBM Plex Serif"
          "Noto Serif"
        ];

        emoji = [
          "Noto Color Emoji"
        ];
      };
    };
  };
