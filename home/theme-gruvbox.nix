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
      package = pkgs.gruvbox-dark-icons-gtk;
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

  programs.starship.settings.palette = "gruvbox_dark";

  # ============================================================
  # Fuzzel
  # ============================================================

  programs.fuzzel.settings = {
    main.icon-theme = "oomox-gruvbox-dark";

    colors = {
      background = "3c3836f2";
      text = "fbf1c7ff";
      match = "458588ff";
      selection = "665c54ff";
      selection-text = "fbf1c7ff";
      selection-match = "d79921ff";
      border = "d79921ff";
    };
  };
}
