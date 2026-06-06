{ pkgs, ... }:

let

  mkScript = name:
    pkgs.writeShellScriptBin name
      (builtins.readFile ../../assets/scripts/${name});

  mkTheme = name: path:
    pkgs.writeShellScriptBin name
      (builtins.readFile path);

in
{
  environment.systemPackages = [

    (mkScript "theme-toggle")
    (mkScript "wallpaper")
    (mkScript "wallpaperd")

    (mkTheme "theme-graphite"
      ../../assets/themes/graphite/apply)

    (mkTheme "theme-vintage"
      ../../assets/themes/vintage/apply)
  ];
}
