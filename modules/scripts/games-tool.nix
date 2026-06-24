{ config, pkgs, ... }:

let

  mkScript = name:
    pkgs.writeShellScriptBin name
      (builtins.readFile ../../modules/scripts/games/${name});

in
{

  # ============================================================
  # Environment Scripts (Steam & Games)
  # ============================================================

  environment.systemPackages = [
    (mkScript "cs2")
  ];
}
