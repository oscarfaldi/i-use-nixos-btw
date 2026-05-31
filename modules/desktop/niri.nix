{ config, pkgs, ... }:

{
  programs.niri.enable = true;

  # Bluetooth
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  services.blueman.enable = true;

  environment.systemPackages = with pkgs; [

    # Niri ecosystem
    xwayland-satellite
    xdg-desktop-portal-gnome
    xdg-utils

    # File manager
    nautilus
    yazi

    # Bar & launcher
    waybar
    fuzzel

    # Clipboard
    cliphist

    # Notifications
    mako
    libnotify

    # Lock / idle
    swaylock
    swayidle

    # Screenshots
    grim
    slurp

    # Media controls
    playerctl

    # Brightness
    brightnessctl

    # Bluetooth
    bluez
    blueman

    # Qt Wayland support
    qt5.qtwayland
    qt6.qtwayland
  ];
}
