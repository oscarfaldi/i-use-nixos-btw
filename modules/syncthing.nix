{ pkgs, ... }:

{
  services.syncthing = {
    enable = true;

    user = "oscarfaldi";

    dataDir = "/home/oscarfaldi";
    configDir = "/home/oscarfaldi/.config/syncthing";

    openDefaultPorts = true;

    settings = {
      devices = {
        nas = {
          id = "RU6UQC6-T7MYCCR-OE4DIP4-WRTINUL-6V4PLNJ-ADWZIRF-QJVYRTD-DSRK5A5";
        };
      };

      folders = {
        "qvuul-fxrvu" = {
          id = "qvuul-fxrvu";

          path = "/home/oscarfaldi/Obsidian Vault";

          devices = [ "nas" ];

          type = "sendreceive";

          fsWatcherEnabled = true;
          rescanIntervalS = 3600;
        };
      };

      options = {
        urAccepted = -1;
      };
    };
  };
}
