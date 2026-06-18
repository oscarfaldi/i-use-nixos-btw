{ config, pkgs, ... }:

let

  mkScript = name:
    pkgs.writeShellScriptBin name
      (builtins.readFile ../../modules/scripts/actions/${name});

in
{

  # ============================================================
  # Environment Scripts (Actionable Scripts)
  # ============================================================

  environment.systemPackages = [
    (mkScript "screenshot")
    (mkScript "remux-mkv")
  ];
}
