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

    portal = {
      enable = true;

      extraPortals = with pkgs; [
        xdg-desktop-portal-gtk
        xdg-desktop-portal-gnome
      ];

      config.niri = {
        preferred = {
          "org.freedesktop.impl.portal.FileChooser" = "gtk";
          "org.freedesktop.impl.portal.AppChooser" = "gtk";
          "org.freedesktop.impl.portal.Notification" = "gtk";
          "org.freedesktop.impl.portal.Inhibit" = "gtk";

          "org.freedesktop.impl.portal.ScreenCast" = "gnome";
          "org.freedesktop.impl.portal.Screenshot" = "gnome";

          default = "gtk";
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
