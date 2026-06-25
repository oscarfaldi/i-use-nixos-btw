{ config, pkgs, ... }:

let

  mkScript = name:
    pkgs.writeShellScriptBin name
      (builtins.readFile ../../modules/scripts/apps/${name});

in
{

  # ============================================================
  # Environment Scripts (Steam & Games)
  # ============================================================

  environment.systemPackages = [
    (mkScript "cs2")
    (mkScript "davinci-resolve")
  ];
}
