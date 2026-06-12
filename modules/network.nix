{ config, pkgs, ... }:

{

  # ============================================================
  # Network Environment
  # ============================================================

  networking.networkmanager = {
    enable = true;

    ensureProfiles.profiles = {

      # --------------------------------------------------------
      # Internet + Management Network
      # --------------------------------------------------------

      "Internet & NAS" = {
        connection = {
          id = "Internet & NAS";
          type = "ethernet";
          interface-name = "enp7s0";
          autoconnect = "true";
        };

        ipv4.method = "auto";
        ipv6.method = "auto";
      };

      # --------------------------------------------------------
      # Intel X540-T2 Port 1 (10G)
      # --------------------------------------------------------

      "Intel X540-T2 10G Port 1" = {
        connection = {
          id = "Intel X540-T2 10G Port 1";
          type = "ethernet";
          interface-name = "enp4s0f0";
          autoconnect = "true";
        };

        ipv4 = {
          method = "manual";
          address1 = "10.10.20.11/24";
        };

        ipv6.method = "disabled";
      };

      # --------------------------------------------------------
      # Intel X540-T2 Port 2 (10G)
      # --------------------------------------------------------

      "Intel X540-T2 10G Port 2" = {
        connection = {
          id = "Intel X540-T2 10G Port 2";
          type = "ethernet";
          interface-name = "enp4s0f1";
          autoconnect = "true";
        };

        ipv4 = {
          method = "manual";
          address1 = "10.10.21.11/24";
        };

        ipv6.method = "disabled";
      };
    };
  };

  # ============================================================
  # Local DNS Shortcuts
  # ============================================================

  networking.hosts = {
    "10.10.10.10" = [
      "server.local"
      "files.local"
      "music.local"
      "movies.local"
      "n8n.local"
      "npm.local"
      "notes.local"
      "prowlarr.local"
      "radarr.local"
      "sonarr.local"
      "torrent.local"
      "ai.local"
      "transfer.local"
      "browser.local"
      "bazarr.local"
      "sync.local"
      "shlink.local"
      "office.local"
      "now.local"
      "monitor.local"
      "unmanic.local"
    ];
  };

  # ============================================================
  # NAS Mounts
  # ============================================================

  fileSystems = {

    "/mnt/nas/oscarfaldi" = {
      device = "10.10.20.10:/mnt/user/oscarfaldi";
      fsType = "nfs";
      options = [ "noauto" "nofail" "_netdev" "x-systemd.automount" ];
    };

    "/mnt/nas/personalbranding" = {
      device = "10.10.20.10:/mnt/user/personalbranding";
      fsType = "nfs";
      options = [ "noauto" "nofail" "_netdev" "x-systemd.automount" ];
    };

    "/mnt/nas/mulino" = {
      device = "10.10.20.10:/mnt/user/mulino";
      fsType = "nfs";
      options = [ "noauto" "nofail" "_netdev" "x-systemd.automount" ];
    };

    "/mnt/nas/academy" = {
      device = "10.10.20.10:/mnt/user/academy";
      fsType = "nfs";
      options = [ "noauto" "nofail" "_netdev" "x-systemd.automount" ];
    };

    "/mnt/nas/family" = {
      device = "10.10.20.10:/mnt/user/family";
      fsType = "nfs";
      options = [ "noauto" "nofail" "_netdev" "x-systemd.automount" ];
    };

    "/mnt/nas/media" = {
      device = "10.10.20.10:/mnt/user/media";
      fsType = "nfs";
      options = [ "noauto" "nofail" "_netdev" "x-systemd.automount" ];
    };

    "/mnt/nas/download" = {
      device = "10.10.20.10:/mnt/user/download";
      fsType = "nfs";
      options = [ "noauto" "nofail" "_netdev" "x-systemd.automount" ];
    };

    "/mnt/nas/games" = {
      device = "10.10.20.10:/mnt/user/games";
      fsType = "nfs";
      options = [ "noauto" "nofail" "_netdev" "x-systemd.automount" ];
    };

    "/mnt/nas/toolkit" = {
      device = "10.10.20.10:/mnt/user/toolkit";
      fsType = "nfs";
      options = [ "noauto" "nofail" "_netdev" "x-systemd.automount" ];
    };

    "/mnt/nas/snapshot" = {
      device = "10.10.20.10:/mnt/user/snapshot";
      fsType = "nfs";
      options = [ "noauto" "nofail" "_netdev" "x-systemd.automount" ];
    };

    "/mnt/nas/valhalla" = {
      device = "10.10.20.10:/mnt/user/valhalla";
      fsType = "nfs";
      options = [ "noauto" "nofail" "_netdev" "x-systemd.automount" ];
    };

    "/mnt/nas/archive" = {
      device = "10.10.20.10:/mnt/user/archive";
      fsType = "nfs";
      options = [ "noauto" "nofail" "_netdev" "x-systemd.automount" ];
    };
  };

  # ============================================================
  # NetworkManager Profile Cleanup
  # ============================================================

  systemd.services.networkmanager-profile-cleanup = {
    description = "Remove unmanaged NetworkManager profiles";

    after = [ "NetworkManager.service" ];
    wants = [ "NetworkManager.service" ];

    wantedBy = [ "multi-user.target" ];

    serviceConfig.Type = "oneshot";

    script = ''
      allowed=(
        "Internet & NAS"
        "Intel X540-T2 10G Port 1"
        "Intel X540-T2 10G Port 2"
        "lo"
      )

      ${pkgs.networkmanager}/bin/nmcli -t -f NAME connection show | while read -r name; do

        keep=0

        for allowed_name in "''${allowed[@]}"; do
          if [ "$name" = "$allowed_name" ]; then
            keep=1
            break
          fi
        done

        if [ "$keep" -eq 0 ]; then
          echo "Removing NetworkManager profile: $name"
          ${pkgs.networkmanager}/bin/nmcli connection delete "$name" || true
        fi

      done
    '';
  };
}
