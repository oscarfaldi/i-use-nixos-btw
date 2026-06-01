{ config, pkgs, ... }:

{
  fonts = {
    packages = with pkgs; [
      # Nerd Fonts (Menggunakan struktur atribut Nixpkgs modern)
      nerd-fonts.iosevka
      nerd-fonts.ibm-plex-mono

      # Standard Fonts
      jetbrains-mono
      ibm-plex
      inter

      # Unicode / International & Emoji
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-emoji
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
}
