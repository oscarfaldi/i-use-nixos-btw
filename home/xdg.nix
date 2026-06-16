{ config, pkgs, lib, ... }:

{
  xdg = {
    enable = true;

    # XDG Base Directory User Folders configuration
    userDirs = {
      enable = true;
      createDirectories = true;
      setSessionVariables = true;

      # Standard XDG directories
      desktop = "$HOME/Desktop";
      documents = "$HOME/Documents";
      download = "$HOME/Downloads";
      music = "$HOME/Music";
      pictures = "$HOME/Pictures";
      videos = "$HOME/Videos";
      templates = null;

      # Custom non-standard XDG directories managed natively by Home Manager
      extraUserDirs = {
        XDG_GAMES_DIR = "$HOME/Games";
      };
    };

    # Enable native shared MIME-info management
    mime.enable = true;

    # Declarative configuration for Niri desktop portals
    portal = {
      enable = true;
      
      # Generates ~/.config/xdg-desktop-portal/niri-portals.conf automatically
      config.niri = {
        preferred = {
          # GTK backend integrations where possible
          "org.freedesktop.impl.portal.FileChooser" = "gtk";
          "org.freedesktop.impl.portal.AppChooser" = "gtk";
          "org.freedesktop.impl.portal.Notification" = "gtk";
          "org.freedesktop.impl.portal.Inhibit" = "gtk";

          # GNOME backend integrations required for display recording
          "org.freedesktop.impl.portal.ScreenCast" = "gnome";
          "org.freedesktop.impl.portal.Screenshot" = "gnome";

          # Global fallback routing
          "default" = "gtk";
        };
      };
    };
  };
}
