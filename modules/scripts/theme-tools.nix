{ config, pkgs, ... }:

let

  mkScript = name:
    pkgs.writeShellScriptBin name
      (builtins.readFile ../../modules/scripts/theme/${name});

in
{

  # ============================================================
  # Environment Scripts (Themes & Wallpaper)
  # ============================================================

  environment.systemPackages = [
    (mkScript "wallpaper")
    (mkScript "wallpaper-session")
    # (mkScript "theme-dark")
    # (mkScript "theme-nordic")
  ];
}
