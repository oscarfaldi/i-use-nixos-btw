{ pkgs, ... }:

let
  # Common NFS mount options (optimized for public, passwordless shares).
  nfsOptions = [
    # Force NFSv4 (adjust if your NAS uses NFSv3)
    "nfsvers=4"

    # Mount on first access.
    "x-systemd.automount"
    "noauto"

    # Auto-unmount after inactivity (1 minute).
    "x-systemd.idle-timeout=60"

    # Prevent long hangs when NAS is unavailable.
    "x-systemd.device-timeout=5s"
    "x-systemd.mount-timeout=5s"
    "soft" # Fail safely if the server goes down
    "bg"   # Retry mount in the background if it fails initially

    # Never block boot.
    "nofail"
  ];

  # Helper function to reduce duplication for NFS paths.
  mkShare = share: {
    device = "10.10.20.10:/mnt/user/${share}"; # Sesuaikan path export di NAS kamu jika bukan Unraid default (/mnt/user/...)
    fsType = "nfs";
    options = nfsOptions;
  };

in {

  environment.systemPackages = with pkgs; [
    nfs-utils
  ];

  fileSystems."/mnt/nas/archive" = mkShare "archive";

  fileSystems."/mnt/nas/valhalla" = mkShare "valhalla";

  fileSystems."/mnt/nas/snapshot" = mkShare "snapshot";

  fileSystems."/mnt/nas/toolkit" = mkShare "toolkit";

  fileSystems."/mnt/nas/games" = mkShare "games";

  fileSystems."/mnt/nas/download" = mkShare "download";

  fileSystems."/mnt/nas/media" = mkShare "media";

  fileSystems."/mnt/nas/family" = mkShare "family";

  fileSystems."/mnt/nas/academy" = mkShare "academy";

  fileSystems."/mnt/nas/mulino" = mkShare "mulino";

  fileSystems."/mnt/nas/personalbranding" = mkShare "personalbranding";

  fileSystems."/mnt/nas/oscarfaldi" = mkShare "oscarfaldi";

  fileSystems."/mnt/nas/appdata" = mkShare "appdata";
}
