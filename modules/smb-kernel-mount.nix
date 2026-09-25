{ config, lib, pkgs, ... }:

let
  # The IP or Hostname of your NAS
  nasIp = "10.10.20.10";

  # List of all your NAS share folders
  nasShares = [
    "oscarfaldi"
    "personalbranding"
    "mulino"
    "academy"
    "family"
    "download"
    "games"
    "media-music"
    "media-video"
    "toolkit"
    "snapshot"
    "valhalla"
    "archive"
    "appdata"
  ];

  # Common CIFS mount options shared by all mounts
  commonOptions = [
    "credentials=/etc/smb-credentials"

    "vers=3.1.1"
    "noserverino"

    "uid=1000"
    "gid=100"
    "file_mode=0664"
    "dir_mode=0775"

    "_netdev"
    "nofail"

    # Mount on access instead of connecting to the NAS during boot.
    "x-systemd.automount"

    # Keep the share mounted once connected.
    "x-systemd.idle-timeout=0"

    # Detect an unresponsive SMB connection faster.
    "echo_interval=5"

    "x-systemd.mount-timeout=5s"
  ];
in
{
  # Dynamically map the share list into the fileSystems attribute set
  fileSystems = lib.genAttrs (map (s: "/mnt/nas/${s}") nasShares) (mountPoint:
    let
      share = lib.removePrefix "/mnt/nas/" mountPoint;
    in
    {
      device = "//${nasIp}/${share}";
      fsType = "cifs";
      options = commonOptions;
    }
  );
}
