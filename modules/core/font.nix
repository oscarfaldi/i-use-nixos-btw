{ config, pkgs, ... }:

{
  fonts = {
    packages = with pkgs; [

      # Nerd Fonts
      nerd-fonts.iosevka
      nerd-fonts.blex-mono

      # IBM Plex
      ibm-plex

      # Unicode / International
      noto-fonts
      noto-fonts-cjk-sans

      # Emoji
      noto-fonts-color-emoji

      # Optional old-school terminal feel
      terminus_font
    ];

    fontconfig = {
      enable = true;

      defaultFonts = {

        monospace = [
          "IosevkaTermSlab Nerd Font"
          "BlexMono Nerd Font"
          "IBM Plex Mono"
          "Terminus"
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

  environment.systemPackages = with pkgs; [
    papirus-icon-theme
    bibata-cursors
    graphite-gtk-theme
  ];
}
