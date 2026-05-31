{ pkgs, ... }:

let

# Common SMB mount options.

smbOptions = [
"credentials=/persist/secrets/smb"

```
# Mount on first access.
"x-systemd.automount"
"noauto"

# Auto-unmount after inactivity.
"x-systemd.idle-timeout=60"

# Prevent long hangs when NAS is unavailable.
"x-systemd.device-timeout=5s"
"x-systemd.mount-timeout=5s"

# Never block boot.
"nofail"

# Mount as normal user.
"uid=1000"
"gid=100"
```

];

# Helper function to reduce duplication.

mkShare = share: {
device = "//10.10.20.10/${share}";
fsType = "cifs";
options = smbOptions;
};

in {

environment.systemPackages = with pkgs; [
cifs-utils
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
