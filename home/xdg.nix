{ config, pkgs, lib, ... }:

{
  xdg = {
    enable = true;

    userDirs = {
      enable = true;
      createDirectories = true;
      setSessionVariables = true;

      desktop = "$HOME/Desktop";
      documents = "$HOME/Documents";
      download = "$HOME/Downloads";
      music = "$HOME/Music";
      pictures = "$HOME/Pictures";
      videos = "$HOME/Videos";
      templates = null;
    };

    mime.enable = true;

    # Declarative configuration for Niri desktop portals
    portal = {
      enable = true;
      
      # Generates ~/.config/xdg-desktop-portal/niri-portals.conf
      config.niri = {
        preferred = {
          # GTK everywhere possible
          "org.freedesktop.impl.portal.FileChooser" = "gtk";
          "org.freedesktop.impl.portal.AppChooser" = "gtk";
          "org.freedesktop.impl.portal.Notification" = "gtk";
          "org.freedesktop.impl.portal.Inhibit" = "gtk";

          # Screencasting configuration
          "org.freedesktop.impl.portal.ScreenCast" = "gnome";
          "org.freedesktop.impl.portal.Screenshot" = "gnome";

          # Global fallback
          "default" = "gtk";
        };
      };
    };
  };

  # Activation script to ensure extra directories exist
  home.activation.createGamesDir =
    lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      mkdir -p "$HOME/Games"
    '';
}
