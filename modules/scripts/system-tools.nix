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
    (mkScript "clean")
    (mkScript "rebuild")
    (mkScript "rebuild-boot")
    (mkScript "check-system-state")
    (mkScript "check-system-update")
    (mkScript "upgrade")
    (mkScript "version")
    (mkScript "mount-nas")
    (mkScript "nas-recover")
    (mkScript "nas-debug")
    (mkScript "update-checker")
  ];
}
