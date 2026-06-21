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
    (mkScript "rename-ts-to-mts")
    (mkScript "convert-to-avif")
    (mkScript "convert-image-to-pdf")
    (mkScript "copy-filename")
    (mkScript "copy-filename-no-extension")
    (mkScript "copy-full-path")
    (mkScript "rotate-image-left")
    (mkScript "rotate-image-right")
    (mkScript "rotate-video-left")
    (mkScript "rotate-video-right")
    (mkScript "compress-to-zip")
    (mkScript "extract-here")
  ];
}
