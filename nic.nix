{ config, pkgs, ... }:

  # Intel X540-T2 10G direct NAS connection
  networking.interfaces.enp4s0f0.ipv4.addresses = [
    {
      address = "10.10.20.11";
      prefixLength = 24;
    }
  ];

  networking.interfaces.enp4s0f1.ipv4.addresses = [
    {
      address = "10.10.20.21";
      prefixLength = 24;
    }
  ];
}
