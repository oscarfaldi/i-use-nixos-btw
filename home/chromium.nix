{ config, pkgs, ... }:

{
  programs.chromium = {
    enable = true;

    extensions = [
      { id = "nngceckbapebfimnlniiiahkandclblb"; } # Bitwarden
      { id = "ddkjiahejlhfcafbddmgiahcphecmpfh"; } # uBlock Origin Lite
      { id = "ldgfbffkinooeloadekpmfoklnobpien"; } # Raindrop.io
      { id = "olenolhfominlkfmlkolcahemogebpcj"; } # Fast Save and Repost for Instagram
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

      # Hardware Acceleration & Rendering
      "--enable-features=AcceleratedVideoDecodeLinuxGL"
    ];
  };
}
