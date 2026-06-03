{ config, pkgs, ... }:

# Local domains for NAS reverse proxy services

{
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
}
