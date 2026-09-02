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
  # Starship Theme Colors
  # ============================================================

  programs.starship.settings = {
    palette = "gruvbox_dark";

    palettes.gruvbox_dark = {
      color_fg0 = "#fbf1c7";
      color_bg1 = "#3c3836";
      color_bg3 = "#665c54";

      color_red = "#cc241d";
      color_green = "#98971a";
      color_yellow = "#d79921";
      color_blue = "#458588";
      color_purple = "#b16286";
      color_aqua = "#689d6a";
      color_orange = "#d65d0e";
    };
  };

  # ============================================================
  # Waybar
  # ============================================================

  programs.waybar.style = ''
    @define-color background #3c3836;
    @define-color foreground #fbf1c7;
    @define-color muted #665c54;
    @define-color accent #458588;
    @define-color warning #cc241d;

    * {
        font-family: "JetBrainsMono Nerd Font";
        font-size: 14px;
        min-height: 35px;
        font-weight: bold;
    }

    window#waybar {
        background: alpha(@background, 0.6);
        color: @foreground;
        opacity: 1;
    }

    tooltip {
        background: @background;
        border: 1px solid @accent;
        border-radius: 0;
    }

    tooltip label {
        color: @foreground;
        font-family: "JetBrainsMono Nerd Font";
        font-weight: bold;
        font-size: 15px;
    }

    #custom-logo {
        color: @foreground;
        padding: 0 6px;
        font-weight: bold;
        margin-left: 15px;
    }

    #workspaces button {
        color: @muted;
        padding: 0;
        border: none;
        margin-left: 10px;
        min-width: 15px;
    }

    #workspaces button.active {
        color: @accent;
    }

    #clock {
        color: @foreground;
        font-weight: bold;
        padding: 0 8px;
    }

    #cpu {
        color: @foreground;
        padding: 0 8px;
        font-weight: bold;
    }

    #memory {
        color: @foreground;
        padding: 0 8px;
        font-weight: bold;
    }

    #pulseaudio {
        color: @foreground;
        padding: 0 8px;
        font-weight: bold;
    }

    #tray {
        color: @foreground;
        padding: 0 10px;
        font-weight: bold;
    }

    #custom-updates {
        color: @foreground;
        padding: 0 5px;
        font-weight: bold;
    }

    #custom-power {
        color: @foreground;
        padding: 0 10px;
        font-weight: bold;
        margin-right: 15px;
    }
  '';

  # ============================================================
  # Fuzzel
  # ============================================================

  programs.fuzzel.settings = {
    main.icon-theme = "oomox-gruvbox-dark";

    colors = {
      background = "3c3836cc";
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
