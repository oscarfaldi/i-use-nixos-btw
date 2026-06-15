{ config, pkgs, ... }:

{
  programs.chromium = {
    enable = true;

    extensions = [
      { id = "nngceckbapebfimnlniiiahkandclblb"; } # Bitwarden
      { id = "mnjggcdmjocbbbhaepdhchncahnbgone"; } # uBlock Origin Lite
      { id = "ldgfbffkinooeloadekpmfoklnobpien"; } # Raindrop.io
      { id = "olenolhfominlkfmlkolcahemogebpcj"; } # Fast Save and Repost for Instagram
    ];

    commandLineArgs = [
      # UI
      "--disable-smooth-scrolling"
      "--disable-features=TabHoverCardImages"

      # Wayland
      "--ozone-platform=wayland"

      # Session
      "--restore-last-session"

      # Hardware acceleration
      "--enable-features=VaapiVideoDecoder"
      "--ignore-gpu-blocklist"
      "--enable-zero-copy"
      "--enable-gpu-rasterization"
    ];
  };
}
