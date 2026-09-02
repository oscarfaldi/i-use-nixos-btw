{ config, pkgs, ... }:

{
  # ============================================================
  # Gruvbox GTK Theme
  # ============================================================

  gtk = {
    enable = true;

    theme = {
      package = pkgs.gruvbox-dark-gtk;
      name = "gruvbox-dark";
    };

    gtk4.theme = config.gtk.theme;

    iconTheme = {
      package = gruvbox-dark-icons-gtk;
      name = "oomox-gruvbox-dark";
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
