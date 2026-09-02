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
          id = "CW6KEXA-LJKBC6W-KYYKRJZ-BGAEUPZ-OHONXDF-VPIBUEC-RFSZLMY-74EGFQC";
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
