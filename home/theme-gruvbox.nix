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

  # ============================================================
  # Mako
  # ============================================================

  services.mako.settings = {
    background-color = "#3c3836f2";
    text-color = "#fbf1c7ff";
    border-color = "#45858899";

    icon-path = "/run/current-system/sw/share/icons/oomox-gruvbox-dark";

    "urgency=normal" = {
      border-color = "#458588ff";
    };

    "urgency=high" = {
      border-color = "#cc241dff";
    };

    "app-name=lightcord" = {
      border-color = "#458588ff";
    };

    "summary~=\"log-.*\"" = {
      border-color = "#458588ff";
    };
  };

  # ============================================================
  # Ghostty
  # ============================================================

  programs.ghostty.settings = {
    palette = [
      "0=#32302f"
      "1=#cc241d"
      "2=#98971a"
      "3=#d79921"
      "4=#458588"
      "5=#b16286"
      "6=#689d6a"
      "7=#a89984"
      "8=#928374"
      "9=#fb4934"
      "10=#b8bb26"
      "11=#fabd2f"
      "12=#83a598"
      "13=#d3869b"
      "14=#8ec07c"
      "15=#ebdbb2"
    ];

    background = "#32302f";
    foreground = "#ebdbb2";

    cursor-color = "#ebdbb2";
    cursor-text = "#32302f";

    selection-background = "#ebdbb2";
    selection-foreground = "#32302f";
  };
}
