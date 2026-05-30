{ pkgs, ... }:

{
  home.packages = [
    (pkgs.writeShellScriptBin "screenshot" (
      builtins.readFile ../scripts/screenshot.sh
    ))
  ];
}
