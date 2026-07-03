{ config, pkgs, ... }:

{
  programs.chromium = {
    enable = true;

    extensions = [
      { id = "nngceckbapebfimnlniiiahkandclblb"; } # Bitwarden
      { id = "ddkjiahejlhfcafbddmgiahcphecmpfh"; } # uBlock Origin Lite
      { id = "ldgfbffkinooeloadekpmfoklnobpien"; } # Raindrop.io
      { id = "piibekljdlkbkdchicfdjpnaggolndif"; } # Plucker XBD - X (Twitter) Media One-click Downloader
    ];

    commandLineArgs = [
      # UI
      "--disable-smooth-scrolling"
      "--disable-features=TabHoverCardImages"

      # Wayland
      "--ozone-platform=wayland"
      "--enable-wayland-ime"

      # Session
      "--restore-last-session"
    ];
  };
}
