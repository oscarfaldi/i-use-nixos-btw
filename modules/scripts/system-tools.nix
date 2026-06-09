{ config, pkgs, ... }:

let

  mkScript = name:
    pkgs.writeShellScriptBin name
      (builtins.readFile ../../modules/scripts/system/${name});

in
{

  # ============================================================
  # Environment Scripts (System Maintenance & Utilities)
  # ============================================================

  environment.systemPackages = [
    (mkScript "changes")
    (mkScript "clean")
    (mkScript "rebuild")
    (mkScript "rebuild-boot")
    (mkScript "screenshot")
    (mkScript "system-state")
    (mkScript "upgrade")
    (mkScript "version")
  ];
}
