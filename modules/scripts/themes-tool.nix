{ config, pkgs, ... }:

let

  mkScript = name:
    pkgs.writeShellScriptBin name
      (builtins.readFile ../../modules/scripts/themes/${name});

in
{

  # ============================================================
  # Environment Scripts (Themes & Wallpaper)
  # ============================================================

  environment.systemPackages = [
    (mkScript "wallpaper")
    (mkScript "wallpaper-session")
    # (mkScript "theme-gruvbox")
    # (mkScript "theme-nordic")
  ];
}
