{ config, pkgs, ... }:

{
  fonts = {

    packages = with pkgs; [

      # ----------------------------------------------------------
      # Nerd Fonts
      # ----------------------------------------------------------

      nerd-fonts.iosevka-term-slab
      nerd-fonts.jetbrains-mono

      # ----------------------------------------------------------
      # Monospace
      # ----------------------------------------------------------

      jetbrains-mono
      ibm-plex

      # ----------------------------------------------------------
      # UI Fonts
      # ----------------------------------------------------------

      inter

      # ----------------------------------------------------------
      # Unicode Coverage
      # ----------------------------------------------------------

      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-color-emoji
    ];

    fontconfig = {
      enable = true;

      defaultFonts = {

        monospace = [
          "IosevkaTermSlab Nerd Font"
          "JetBrains Mono"
          "BlexMono Nerd Font"
        ];

        sansSerif = [
          "Inter"
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

    # ============================================================
    # GTK Themes
    # ============================================================

    glib

    graphite-gtk-theme
    gruvbox-gtk-theme

    # ============================================================
    # Icon Themes
    # ============================================================

    papirus-icon-theme
    papirus-folders

    gruvbox-plus-icons

    # ============================================================
    # Cursor Themes
    # ============================================================

    bibata-cursors
  ];
}
