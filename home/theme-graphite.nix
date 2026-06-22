{ config, ... }:

{
  # ============================================================
  # Graphite GTK Theme
  # ============================================================

  gtk = {
    enable = true;

    theme.name = "Graphite-Dark";

    gtk4.theme = config.gtk.theme;

    iconTheme.name = "Papirus-Dark";

    cursorTheme.name = "Bibata-Modern-Ice";

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
