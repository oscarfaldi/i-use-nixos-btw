{ config, pkgs, ... }:

{
  fonts = {
    packages = with pkgs; [

      # Nerd Fonts
      nerd-fonts.jetbrains-mono
      nerd-fonts.iosevka

      # IBM Plex Family
      ibm-plex

      # Unicode / International Fonts
      noto-fonts
      noto-fonts-cjk-sans

      # Emoji
      noto-fonts-color-emoji
    ];

    fontconfig = {
      enable = true;

      defaultFonts = {

        monospace = [
          "JetBrainsMono Nerd Font"
          "IBM Plex Mono"
          "Iosevka Nerd Font"
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
}
