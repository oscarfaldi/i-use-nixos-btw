{ ... }:

{
  nix.settings = {
    substituters = [
      "http://10.10.10.171:8501"
      "https://cache.nixos.org"
    ];

    trusted-public-keys = [
      "ncps.local:MIxzb9CCWYX8qk2Ec79fKD/d4nvc0anIoEL+A7YJVDE="
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
    ];
  };
}
