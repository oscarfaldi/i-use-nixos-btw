{ config, pkgs, ... }:

{
  programs.chromium = {
    enable = true;

    extensions = [
      { id = "nngceckbapebfimnlniiiahkandclblb"; } # Bitwarden
      { id = "ddkjiahejlhfcafbddmgiahcphecmpfh"; } # uBlock Origin Lite
      { id = "cpgaheeihidjmolbakklolchdplenjai"; } # Turbo Downloader for Instagram
      { id = "ldgfbffkinooeloadekpmfoklnobpien"; } # Raindrop.io
      { id = "piibekljdlkbkdchicfdjpnaggolndif"; } # Plucker XBD - X (Twitter) Media One-click Downloader
      { id = "elicpjhcidhpjomhibiffojpinpmmpil"; } # Video Downloader Professional
      { id = "fclobfmgolhdcfcmpbjahiiifilhamcg"; } # Easy TikTok Video Downloader (Remove Watermark)
    ];

    commandLineArgs = [
      # UI
      "--disable-smooth-scrolling"
      "--disable-features=TabHoverCardImages"

      # Wayland
      "--ozone-platform=wayland"
    ];
  };
}
