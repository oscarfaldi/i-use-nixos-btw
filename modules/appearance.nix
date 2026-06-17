{ config, pkgs, ... }:

{
  # ============================================================
  # Fonts Configuration
  # ============================================================

  fonts = {
    packages = with pkgs; [

      # ----------------------------------------------------------
      # Nerd Fonts (Unstable Syntax Compatibility)
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
      # Microsoft Standard Fonts (Windows Defaults)
      # ----------------------------------------------------------

      corefonts           # Arial, Times New Roman, Courier New, Verdana
      vista-fonts          # Calibri, Cambria, Consolas, Segoe UI
      liberation_ttf      # Open-source exact metric fallbacks for MS Fonts

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
          "Consolas"
          "Liberation Mono"
        ];

        sansSerif = [
          "IBM Plex Sans"
          "Noto Sans"
          "Inter"
          "Arial"
          "Calibri"
          "Liberation Sans"
        ];

        serif = [
          "IBM Plex Serif"
          "Noto Serif"
          "Liberation Serif"
          "Times New Roman"
          "Cambria"
        ];

        emoji = [
          "Noto Color Emoji"
        ];
      };
    };
  };

  # ============================================================
  # Visual Environment Packages (Themes & Icons)
  # ============================================================

  environment.systemPackages = with pkgs; [

    # ----------------------------------------------------------
    # GTK Themes
    # ----------------------------------------------------------

    glib
    graphite-gtk-theme
    nordic

    # ----------------------------------------------------------
    # Icon Themes
    # ----------------------------------------------------------

    papirus-icon-theme
    papirus-folders

    # ----------------------------------------------------------
    # Cursor Themes
    # ----------------------------------------------------------

    bibata-cursors
  ];
}
