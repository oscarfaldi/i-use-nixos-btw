{ config, pkgs, ... }:

{
  networking.networkmanager = {
    enable = true;

    # Prevent NetworkManager from automatically creating default "Wired Connection X" profiles.
    # This forces NM to ignore automatic setups on these specific physical interfaces.
    unmanaged = [
      "enp7s0"
      "enp4s0f0"
      "enp4s0f1"
    ];

    # Explicitly define and enforce only these three network profiles
    ensureProfiles.profiles = {
      "Internet & NAS" = {
        connection = {
          id = "Internet & NAS";
          type = "ethernet";
          interface-name = "enp7s0";
        };
        ipv4.method = "auto";
        ipv6.method = "auto";
      };

      "Intel X540-T2 10G Port 1" = {
        connection = {
          id = "Intel X540-T2 10G Port 1";
          type = "ethernet";
          interface-name = "enp4s0f0";
        };
        ipv4 = {
          method = "manual";
          address1 = "10.10.20.11/24";
        };
        ipv6.method = "disabled";
      };

      "Intel X540-T2 10G Port 2" = {
        connection = {
          id = "Intel X540-T2 10G Port 2";
          type = "ethernet";
          interface-name = "enp4s0f1";
        };
        ipv4 = {
          method = "manual";
          address1 = "10.10.21.11/24";
        };
        ipv6.method = "disabled";
      };
    };
  };
}
