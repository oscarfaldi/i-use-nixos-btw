{ ... }:

{
  imports = [
    ./files.nix
    ./shell.nix
    ./xdg.nix
  ];

  home.stateVersion = "25.11";
}
