{ config, pkgs, ... }:

{
  # ============================================================
  # Graphite GTK Theme
  # ============================================================

  gtk = {
    enable = true;

    theme = {
      package = pkgs.graphite-gtk-theme;
      name = "Graphite-Dark";
    };

    gtk4.theme = config.gtk.theme;

    iconTheme = {
      package = papirus-icon-theme;
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

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };
}
