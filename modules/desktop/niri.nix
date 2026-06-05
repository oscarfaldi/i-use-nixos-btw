{ config, pkgs, ... }:

{
  programs.niri.enable = true;

  # Bluetooth
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  # Bluetooth GUI
  services.blueman.enable = true;

  # Virtual filesystem support for network drives, USB, trash, and sidebar integration
  services.gvfs.enable = true;

  # Enable USB automount and removable media support
  services.udisks2.enable = true;

  # Enable dconf for GTK applications or gnome and settings persistence
  programs.dconf.enable = true;

  environment.systemPackages = with pkgs; [

    # Niri ecosystem
    xwayland-satellite

    # File manager
    nautilus
    yazi

    # Wallpaper
    awww

    # Themes & icon
    glib
    graphite-gtk-theme
    papirus-icon-theme
    papirus-folders
    bibata-cursors
    
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

    # Qt Wayland support
    qt5.qtwayland
    qt6.qtwayland
  ];
}
