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
    (mkScript "generate-theme")
    (mkScript "theme-graphite")
    (mkScript "theme-vintage")
    (mkScript "theme-jade")
  ];
}
