{ lib, ... }:

let
  hiddenDesktopEntries = [
    "blackmagicraw-speedtest.desktop"
    "blackmagicraw-player.desktop"
    "cups.desktop"
    "draw.desktop"
    "math.desktop"
    "startcenter.desktop"
    "nixos-manual.desktop"
    "nvidia-settings.desktop"
    "davinci-control-panels-setup.desktop"
    "davinci-fairlight-studio-utility.desktop"
    "davinci-resolve.desktop"
    "nm-connection-editor.desktop"
    "tectonic.desktop"
    "thunar-bulk-rename.desktop"
    "thunar-settings.desktop"
    "thunar-volman-settings.desktop"
  ];
in
{
  home.activation.hideDesktopEntries =
    lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      set -eu

      SRC="/run/current-system/sw/share/applications"
      DST="$HOME/.local/share/applications"

      mkdir -p "$DST"

      for desktop in ${lib.concatStringsSep " " hiddenDesktopEntries}; do
        src="$SRC/$desktop"
        dst="$DST/$desktop"

        [ -f "$src" ] || continue

        cp "$src" "$dst"

        if grep -q '^NoDisplay=' "$dst"; then
          sed -i \
            's/^NoDisplay=.*/NoDisplay=true/' \
            "$dst"
        else
          sed -i \
            '/^\[Desktop Entry\]/a NoDisplay=true' \
            "$dst"
        fi
      done
    '';
}
