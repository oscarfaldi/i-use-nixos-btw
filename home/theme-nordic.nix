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
  # Starship Theme Colors
  # ============================================================

  programs.starship.settings = {
    palette = "tokyo_night";

    palettes.tokyo_night = {
      color_fg0 = "#e3e5e5";
      color_bg1 = "#1d2230";
      color_bg3 = "#212736";

      color_blue = "#212736";
      color_aqua = "#394260";
      color_green = "#769ff0";
      color_orange = "#a3aed2";
      color_purple = "#212736";
      color_red = "#bf616a";
      color_yellow = "#769ff0";
    };
  };


  # ============================================================
  # Waybar
  # ============================================================

  programs.waybar.style = ''
    /* ==========================================================
       Nordic Color Palette
       ========================================================== */

    @define-color background #242933;
    @define-color foreground #bbc3d4;
    @define-color muted #3b4252;
    @define-color accent #5e81ac;
    @define-color warning #bf616a;


    /* ==========================================================
       Core Configuration & Typography
       ========================================================== */

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


    /* ==========================================================
       Tooltips
       ========================================================== */

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


    /* ==========================================================
       Modules: Left
       ========================================================== */

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


    /* ==========================================================
       Modules: Center
       ========================================================== */

    #clock {
        color: @foreground;
        font-weight: bold;
        padding: 0 8px;
    }


    /* ==========================================================
       Modules: Right
       ========================================================== */

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
    main.icon-theme = "papirus-icon-theme";

    colors = {
      background = "242933cc";
      text = "bbc3d4ff";
      match = "5e81acff";
      selection = "1b1f26ff";
      selection-text = "bbc3d4ff";
      selection-match = "5e81acff";
      border = "5e81ac66";
    };
  };


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


  # ============================================================
  # Ghostty
  # ============================================================

  programs.ghostty.settings = {
    palette = [
      "0=#191d24"
      "1=#bf616a"
      "2=#a3be8c"
      "3=#ebcb8b"
      "4=#5e81ac"
      "5=#b48ead"
      "6=#8fbcbb"
      "7=#bbc3d4"
      "8=#3b4252"
      "9=#c5727a"
      "10=#b1c89d"
      "11=#efd49f"
      "12=#88c0d0"
      "13=#be9d88"
      "14=#9fc6c5"
      "15=#d8dee9"
    ];

    background = "#242933";
    foreground = "#bbc3d4";

    cursor-color = "#bbc3d4";
    cursor-text = "#191d24";

    selection-background = "#1b1f26";
    selection-foreground = "#bbc3d4";
  };
}
