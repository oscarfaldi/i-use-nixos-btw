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
    "media"
    "download"
    "games"
    "toolkit"
    "snapshot"
    "valhalla"
    "archive"
  ];

  # Common CIFS mount options shared by all mounts
  commonOptions = [
    "credentials=/etc/nixos/secrets/smb-credentials"
    "vers=3.1.1"
    "uid=1000"
    "gid=100"
    "file_mode=0664"
    "dir_mode=0775"
    "cache=strict"
    "x-systemd.automount"
    "noauto"
    "_netdev"
    "nofail"
    "x-systemd.device-timeout=5s"
    "x-systemd.mount-timeout=30s"
  ];
in
{
  # Ensures NixOS has the necessary utilities to mount CIFS/Samba shares
  environment.systemPackages = [ pkgs.cifs-utils ];

  # Dynamically map the share list into the fileSystems attribute set
  fileSystems = lib.genAttrs (map (s: "/mnt/nas/${s}") nasShares) (mountPoint: 
    let share = lib.removePrefix "/mnt/nas/" mountPoint;
    in {
      device = "//${nasIp}/${share}";
      fsType = "cifs";
      options = commonOptions;
  });
}
