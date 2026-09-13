{ config, pkgs, ... }:

{
  programs.microsoft-edge = {
    enable = true;

    extensions = [
      { id = "inomeogfingihgjfjlpeplalcfajhgai"; } # Chrome Remote Desktop
      { id = "pdffkfellgipmhklpdmokmckkkfcopbh"; } # AdGuard AdBlocker
      { id = "jlhgedjpndhblehblebhncfmkkpngiep"; } # Reddit Enhancement Suite
      { id = "cpgaheeihidjmolbakklolchdplenjai"; } # Turbo Downloader for Instagram
      { id = "piibekljdlkbkdchicfdjpnaggolndif"; } # Plucker XBD - X (Twitter) Media One-click Downloader
      { id = "elicpjhcidhpjomhibiffojpinpmmpil"; } # Video Downloader Professional
      { id = "fclobfmgolhdcfcmpbjahiiifilhamcg"; } # Easy TikTok Video Downloader (Remove Watermark)

      # Legacy Chromium
      # { id = "ldgfbffkinooeloadekpmfoklnobpien"; } # Raindrop.io
      # { id = "nngceckbapebfimnlniiiahkandclblb"; } # Bitwarden
      # { id = "ddkjiahejlhfcafbddmgiahcphecmpfh"; } # uBlock Origin Lite
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
