{ config, pkgs, lib, ... }:

{
  home.activation.onlyoffice-fonts =
    lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      FONT_DIR="$HOME/.local/share/fonts/onlyoffice"

      echo "Setting up ONLYOFFICE fonts..."

      mkdir -p "$FONT_DIR"

      find /run/current-system/sw/share/fonts \
        -type f \
        \( -iname "*.ttf" -o -iname "*.otf" -o -iname "*.ttc" \) \
        -exec cp -f {} "$FONT_DIR/" \; \
        2>/dev/null || true

      ${pkgs.fontconfig}/bin/fc-cache -f "$FONT_DIR"

      rm -rf \
        "$HOME/.local/share/onlyoffice/desktopeditors/data/fonts" \
        2>/dev/null || true
    '';

  xdg.configFile."onlyoffice/README".text = ''
    ONLYOFFICE Configuration Notes

    Preferred settings:

    Theme:
      Modern Dark

    Spreadsheet:
      Font: Arial
      Size: 10

    Regional:
      Currency: IDR
      Date: DD/MM/YYYY
      Decimal separator: .
      Thousands separator: ,

    Autosave:
      Enabled

    Auto Recovery:
      Enabled
      Interval: 1 minute
  '';
}
