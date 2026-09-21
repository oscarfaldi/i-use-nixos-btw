{ config, pkgs, ... }:

{
  programs.ssh = {
    enable = true;

    matchBlocks.cascade = {
      hostname = "10.10.10.10";
      user = "root";
      identityFile = "~/.ssh/id_ed25519_cascade";
    };
  };
}
