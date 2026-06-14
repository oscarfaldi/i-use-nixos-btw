{ config, pkgs, ... }:

{
  imports = [
    <home-manager/nixos>
  ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;

    users.oscarfaldi = import ../home;
  };
}
