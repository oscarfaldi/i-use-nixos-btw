{ config, pkgs, ... }:

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
  };

  home.activation.createGamesDir =
    config.lib.dag.entryAfter [ "writeBoundary" ] ''
      mkdir -p "$HOME/Games"
    '';
}
