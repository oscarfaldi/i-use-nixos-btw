{ config, pkgs, ... }:

{
  # NetworkManager for internet / normal LAN
  networking.networkmanager.enable = true;

  # Local domains for NAS reverse proxy services
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
      "unmanic.local"
    ];
  };

  # Intel X540-T2 10G direct NAS connection
  networking.interfaces.enp4s0f0.ipv4.addresses = [
    {
      address = "10.10.20.11";
      prefixLength = 24;
    }
  ];

  networking.interfaces.enp4s0f1.ipv4.addresses = [
    {
      address = "10.10.20.21";
      prefixLength = 24;
    }
  ];
}
