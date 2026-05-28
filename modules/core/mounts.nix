{ config, pkgs, ... }:

{
  # Configuration SMB with automount (Prompt via GVFS/Thunar)
  fileSystems."/mnt/nas/academy" = {
    device = "//10.10.20.10/academy";
    fsType = "cifs";
    options = [ "x-systemd.automount" "noauto" "uid=1000" "gid=100" "file_mode=0755" "dir_mode=0755" ];
  };

  fileSystems."/mnt/nas/appdata" = {
    device = "//10.10.20.10/appdata";
    fsType = "cifs";
    options = [ "x-systemd.automount" "noauto" "uid=1000" "gid=100" "file_mode=0755" "dir_mode=0755" ];
  };

  fileSystems."/mnt/nas/archive" = {
    device = "//10.10.20.10/archive";
    fsType = "cifs";
    options = [ "x-systemd.automount" "noauto" "uid=1000" "gid=100" "file_mode=0755" "dir_mode=0755" ];
  };

  fileSystems."/mnt/nas/download" = {
    device = "//10.10.20.10/download";
    fsType = "cifs";
    options = [ "x-systemd.automount" "noauto" "uid=1000" "gid=100" "file_mode=0755" "dir_mode=0755" ];
  };

  fileSystems."/mnt/nas/family" = {
    device = "//10.10.20.10/family";
    fsType = "cifs";
    options = [ "x-systemd.automount" "noauto" "uid=1000" "gid=100" "file_mode=0755" "dir_mode=0755" ];
  };

  fileSystems."/mnt/nas/games" = {
    device = "//10.10.20.10/games";
    fsType = "cifs";
    options = [ "x-systemd.automount" "noauto" "uid=1000" "gid=100" "file_mode=0755" "dir_mode=0755" ];
  };

  fileSystems."/mnt/nas/media" = {
    device = "//10.10.20.10/media";
    fsType = "cifs";
    options = [ "x-systemd.automount" "noauto" "uid=1000" "gid=100" "file_mode=0755" "dir_mode=0755" ];
  };

  fileSystems."/mnt/nas/mulino" = {
    device = "//10.10.20.10/mulino";
    fsType = "cifs";
    options = [ "x-systemd.automount" "noauto" "uid=1000" "gid=100" "file_mode=0755" "dir_mode=0755" ];
  };

  fileSystems."/mnt/nas/nutrivibes" = {
    device = "//10.10.20.10/nutrivibes";
    fsType = "cifs";
    options = [ "x-systemd.automount" "noauto" "uid=1000" "gid=100" "file_mode=0755" "dir_mode=0755" ];
  };

  fileSystems."/mnt/nas/oscarfaldi" = {
    device = "//10.10.20.10/oscarfaldi";
    fsType = "cifs";
    options = [ "x-systemd.automount" "noauto" "uid=1000" "gid=100" "file_mode=0755" "dir_mode=0755" ];
  };

  fileSystems."/mnt/nas/personalbranding" = {
    device = "//10.10.20.10/personalbranding";
    fsType = "cifs";
    options = [ "x-systemd.automount" "noauto" "uid=1000" "gid=100" "file_mode=0755" "dir_mode=0755" ];
  };

  fileSystems."/mnt/nas/snapshot" = {
    device = "//10.10.20.10/snapshot";
    fsType = "cifs";
    options = [ "x-systemd.automount" "noauto" "uid=1000" "gid=100" "file_mode=0755" "dir_mode=0755" ];
  };

  fileSystems."/mnt/nas/toolkit" = {
    device = "//10.10.20.10/toolkit";
    fsType = "cifs";
    options = [ "x-systemd.automount" "noauto" "uid=1000" "gid=100" "file_mode=0755" "dir_mode=0755" ];
  };

  fileSystems."/mnt/nas/valhalla" = {
    device = "//10.10.20.10/valhalla";
    fsType = "cifs";
    options = [ "x-systemd.automount" "noauto" "uid=1000" "gid=100" "file_mode=0755" "dir_mode=0755" ];
  };
}
