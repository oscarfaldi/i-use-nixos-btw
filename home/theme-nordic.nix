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

  programs.fuzzel.settings = {
    main.icon-theme = "papirus-icon-theme";

    colors = {
      background = "242933cc";
      text = "bbc3d4ff";
      match = "5e81acff";
      selection = "1b1f26ff";
      selection-text = "bbc3d4ff";
      selection-match = "5e81acff";
      border = "5e81ac66";

  # ============================================================
  # Mako
  # ============================================================

  services.mako.settings = {
    background-color = "#242933cc";
    text-color = "#bbc3d4ff";
    border-color = "#5e81ac99";
  
    icon-path = "/run/current-system/sw/share/icons/Papirus";
  
    "urgency=normal" = {
      border-color = "#5e81acff";
    };
  
    "urgency=high" = {
      border-color = "#bf616aff";
    };
  
    "app-name=lightcord" = {
      border-color = "#5e81acff";
    };
  
    "summary~=\"log-.*\"" = {
      border-color = "#5e81acff";
        };
      };
    };
  };
}
