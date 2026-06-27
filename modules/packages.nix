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

  # Enable dbus system
  services.dbus.enable = true;

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

  # Provide pkexec wrapper required by GParted and other Polkit apps
  security.wrappers.pkexec = {
    source = "${pkgs.polkit}/bin/pkexec";
    owner = "root";
    group = "root";
    setuid = true;
  };

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
    tree

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

    yazi

    xarchiver

    zip
    unzip
    p7zip
    unrar

    atril
    pdfarranger
    pandoc
    tectonic
    img2pdf

    libreoffice
    # obsidian
    mousepad

    cifs-utils
    nfs-utils
    rsync

    # ------------------------------------------------------------
    # Media
    # ------------------------------------------------------------

    mpv
    mpvScripts.uosc
    mpvScripts.thumbfast
    mpvScripts.builtins.autoload

    qimgv
    imagemagick

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

    zenity

    wl-clipboard

    brightnessctl
    playerctl

    qalculate-gtk

    wlogout

    nvibrant

    gparted
    ntfs3g
    exfatprogs
    parabolic

    # ------------------------------------------------------------
    # Wallpaper
    # ------------------------------------------------------------

    awww

    # ------------------------------------------------------------
    # Qt Wayland
    # ------------------------------------------------------------

    qt5.qtwayland
    qt6.qtwayland
  ];
}
