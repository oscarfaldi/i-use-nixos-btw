{ config, pkgs, ... }:

let
  mkShellScript = name:
    pkgs.writeShellScriptBin name
      (builtins.readFile ../../modules/scripts/actions/${name});

  mkPythonScript = name:
    pkgs.writeScriptBin name
      (builtins.readFile ../../modules/scripts/actions/${name});
in
{
  # ============================================================
  # Environment Scripts (Actionable Scripts)
  # ============================================================
  environment.systemPackages = [
    # ------------------------------------------------------------
    # Shell Scripts
    # ------------------------------------------------------------
    (mkShellScript "screenshot")
    (mkShellScript "rename-ts-to-mts")

    (mkShellScript "convert-to-avif")
    (mkShellScript "convert-to-png")
    (mkShellScript "convert-to-jpeg")
    (mkShellScript "convert-to-pdf")
    (mkShellScript "convert-to-prores")

    (mkShellScript "copy-filename")
    (mkShellScript "copy-filename-no-extension")
    (mkShellScript "copy-full-path")

    (mkShellScript "rotate-image-left")
    (mkShellScript "rotate-image-right")

    (mkShellScript "rotate-video-left")
    (mkShellScript "rotate-video-right")

    (mkShellScript "compress-to-zip")
    (mkShellScript "extract-here")

    (mkShellScript "move-to-valhalla-pictures-staging")
    (mkShellScript "move-to-valhalla-videos-staging")

    (mkShellScript "archive-home-folders-to-nas")

    # ------------------------------------------------------------
    # Python Scripts
    # ------------------------------------------------------------
    (mkPythonScript "transcribe-video")
  ];
}
