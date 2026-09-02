{ config, pkgs, ... }:

{
  # ============================================================
  # Nordic GTK Theme
  # ============================================================

  gtk = {
    enable = true;

    theme = {
      package = pkgs.nordic;
      name = "Nordic";
    };

    gtk4.theme = config.gtk.theme;

    iconTheme = {
      package = pkgs.papirus-icon-theme;
      name = "Papirus-Dark";
    };

    cursorTheme = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
    };

    font = {
      name = "JetBrainsMono Nerd Font";
      size = 11;
    };

    gtk3.extraConfig = {
      gtk-menu-images = true;
    };
  };

  # ============================================================
  # GNOME Appearance
  # ============================================================

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };

  # ============================================================
  # Starship
  # ============================================================

  programs.starship.settings.palette = "tokyo_night";

  # ============================================================
  # Fuzzel
  # ============================================================

  programs.fuzzel.settings.colors = {
    background = "242933cc";
    text = "bbc3d4ff";
    match = "5e81acff";
    selection = "1b1f26ff";
    selection-text = "bbc3d4ff";
    selection-match = "5e81acff";
    border = "5e81ac66";
  };
}
