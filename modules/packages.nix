{ config, pkgs, ... }:

{
  # ============================================================
  # Desktop Environment
  # ============================================================

  # Enable niri as a compositor or window manager
  programs.niri.enable = true;

  # Enable dconf for GTK applications and settings persistence
  programs.dconf.enable = true;

  # Enable xfconf for saving thunar configuration
  programs.xfconf.enable = true;

  # Enable thumbnail for thunar
  services.tumbler.enable = true;

  # Virtual filesystem support (USB, trash, network shares, sidebar integration)
  services.gvfs.enable = true;

  # USB automount and removable media support
  services.udisks2.enable = true;

  # GNOME keyring for credentials and secrets
  services.gnome.gnome-keyring.enable = true;

  # Privilege escalation framework
  security.polkit.enable = true;

  # ZSH enable
  programs.zsh.enable = true;

  # ============================================================
  # Optional Services
  # ============================================================

  # Bluetooth
  # hardware.bluetooth = {
  #   enable = true;
  #   powerOnBoot = true;
  # };

  # Bluetooth GUI
  # services.blueman.enable = true;

  # Syncthing
  # services.syncthing = {
  #   enable = true;
  #   user = "oscarfaldi";
  #   dataDir = "/home/oscarfaldi";
  #   configDir = "/home/oscarfaldi/.config/syncthing";
  #   openDefaultPorts = true;
  # };

  # ============================================================
  # Desktop Applications
  # ============================================================

  environment.systemPackages = with pkgs; [

    # ------------------------------------------------------------
    # Core Desktop
    # ------------------------------------------------------------

    xdg-utils
    networkmanagerapplet
    polkit_gnome

    # ------------------------------------------------------------
    # Terminal & Development
    # ------------------------------------------------------------

    bash
    zsh
    zsh-autosuggestions
    zsh-completions

    git
    nano
    wget

    ghostty
    neovim
    zed-editor

    # ------------------------------------------------------------
    # Terminal Utilities
    # ------------------------------------------------------------

    fastfetch
    btop
    nvd

    zoxide
    eza
    bat
    fzf
    ripgrep
    fd

    jq
    yq-go

    starship

    man-pages
    man-pages-posix

    # ------------------------------------------------------------
    # Niri Ecosystem
    # ------------------------------------------------------------

    xwayland-satellite

    waybar
    fuzzel

    mako
    libnotify

    swaylock
    swayidle

    # ------------------------------------------------------------
    # File Management & Documents
    # ------------------------------------------------------------

    thunar
    tumbler
    thunar-archive-plugin
    thunar-volman
    thunar-media-tags-plugin
    
    yazi

    xarchiver

    unzip
    p7zip
    unrar

    papers
    pdfarranger

    onlyoffice-desktopeditors
    # obsidian
    mousepad

    nfs-utils

    # ------------------------------------------------------------
    # Media
    # ------------------------------------------------------------

    mpv
    mpvScripts.uosc
    mpvScripts.thumbfast
    mpvScripts.builtins.autoload

    qimgv

    ffmpeg
    ffmpegthumbnailer

    libwebp
    libavif
    librsvg
    libgepub
    libopenraw
    libgsf

    grim
    slurp

    # ------------------------------------------------------------
    # System Controls
    # ------------------------------------------------------------

    pwvucontrol

    brightnessctl
    playerctl

    gnome-calculator

    wlogout

    gparted
    parabolic

    # ------------------------------------------------------------
    # Wallpaper
    # ------------------------------------------------------------

    awww

    # ------------------------------------------------------------
    # Theming
    # ------------------------------------------------------------

    glib

    graphite-gtk-theme
    gruvbox-gtk-theme

    papirus-icon-theme
    gruvbox-plus-icons

    bibata-cursors

    # ------------------------------------------------------------
    # Qt Wayland
    # ------------------------------------------------------------

    qt5.qtwayland
    qt6.qtwayland
  ];
}
