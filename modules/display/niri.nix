{ config, pkgs, ... }:

{
  programs.niri.enable = true;

  environment.systemPackages = with pkgs; [

    # Niri ecosystem
    xwayland-satellite
    xdg-desktop-portal-gtk
    xdg-utils

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

    # Polkit authentication agent
    mate.mate-polkit

    # Qt Wayland support
    qt5.qtwayland
    qt6.qtwayland
  ];
}
