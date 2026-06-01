{ ... }:

let
  nasShares = [
    "academy"
    "appdata"
    "archive"
    "download"
    "family"
    "games"
    "media"
    "mulino"
    "oscarfaldi"
    "personalbranding"
    "snapshot"
    "toolkit"
    "valhalla"
  ];

  commonOptions = [
    "nfsvers=4"

    # Automount saat diakses
    "x-systemd.automount"
    "noauto"

    # Unmount otomatis setelah idle
    "x-systemd.idle-timeout=60"

    # Biar boot gak nunggu NAS
    "nofail"

    # Timeout cepat kalau NAS mati
    "x-systemd.device-timeout=5s"
    "x-systemd.mount-timeout=5s"
  ];
in
{
  fileSystems = builtins.listToAttrs (map (share: {
    name = "/mnt/nas/${share}";
    value = {
      device = "10.10.20.10:/mnt/user/${share}";
      fsType = "nfs";
      options = commonOptions;
    };
  }) nasShares);
}
