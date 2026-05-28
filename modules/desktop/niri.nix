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
    xdg-desktop-portal-gtk
    xdg-utils

    # File manager
    xfce.thunar
    xfce.thunar-archive-plugin
    xfce.thunar-volman
    xfce.xfconf
    xfce.xfce4-icon-theme
    librsvg
    yazi

    # Bar & launcher
    waybar
    fuzzel

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
