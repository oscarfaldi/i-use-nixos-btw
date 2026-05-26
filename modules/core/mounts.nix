{ config, pkgs, ... }:

{
  fileSystems."/mnt/nas/academy" = {
    device = "10.10.20.10:/mnt/user/academy";
    fsType = "nfs";
    options = [ "nfsvers=4" "x-systemd.automount" "noauto" ];
  };

  fileSystems."/mnt/nas/appdata" = {
    device = "10.10.20.10:/mnt/user/appdata";
    fsType = "nfs";
    options = [ "nfsvers=4" "x-systemd.automount" "noauto" ];
  };

  fileSystems."/mnt/nas/archive" = {
    device = "10.10.20.10:/mnt/user/archive";
    fsType = "nfs";
    options = [ "nfsvers=4" "x-systemd.automount" "noauto" ];
  };

  fileSystems."/mnt/nas/download" = {
    device = "10.10.20.10:/mnt/user/download";
    fsType = "nfs";
    options = [ "nfsvers=4" "x-systemd.automount" "noauto" ];
  };

  fileSystems."/mnt/nas/family" = {
    device = "10.10.20.10:/mnt/user/family";
    fsType = "nfs";
    options = [ "nfsvers=4" "x-systemd.automount" "noauto" ];
  };

  fileSystems."/mnt/nas/games" = {
    device = "10.10.20.10:/mnt/user/games";
    fsType = "nfs";
    options = [ "nfsvers=4" "x-systemd.automount" "noauto" ];
  };

  fileSystems."/mnt/nas/media" = {
    device = "10.10.20.10:/mnt/user/media";
    fsType = "nfs";
    options = [ "nfsvers=4" "x-systemd.automount" "noauto" ];
  };

  fileSystems."/mnt/nas/mulino" = {
    device = "10.10.20.10:/mnt/user/mullino";
    fsType = "nfs";
    options = [ "nfsvers=4" "x-systemd.automount" "noauto" ];
  };

  fileSystems."/mnt/nas/nutrivibes" = {
    device = "10.10.20.10:/mnt/user/nutrivibes";
    fsType = "nfs";
    options = [ "nfsvers=4" "x-systemd.automount" "noauto" ];
  };

  fileSystems."/mnt/nas/oscarfaldi" = {
    device = "10.10.20.10:/mnt/user/oscarfaldi";
    fsType = "nfs";
    options = [ "nfsvers=4" "x-systemd.automount" "noauto" ];
  };

  fileSystems."/mnt/nas/personalbranding" = {
    device = "10.10.20.10:/mnt/user/personalbranding";
    fsType = "nfs";
    options = [ "nfsvers=4" "x-systemd.automount" "noauto" ];
  };

  fileSystems."/mnt/nas/snapshot" = {
    device = "10.10.20.10:/mnt/user/snapshot";
    fsType = "nfs";
    options = [ "nfsvers=4" "x-systemd.automount" "noauto" ];
  };

  fileSystems."/mnt/nas/toolkit" = {
    device = "10.10.20.10:/mnt/user/toolkit";
    fsType = "nfs";
    options = [ "nfsvers=4" "x-systemd.automount" "noauto" ];
  };

  fileSystems."/mnt/nas/valhalla" = {
    device = "10.10.20.10:/mnt/user/valhalla";
    fsType = "nfs";
    options = [ "nfsvers=4" "x-systemd.automount" "noauto" ];
  };
}
