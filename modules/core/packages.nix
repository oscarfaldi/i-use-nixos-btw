{ config, pkgs, ... }:

  # Enable gnome keyring for passwords and credentials
  services.gnome.gnome-keyring.enable = true;

  # Syncthing file synchronization service
  services.syncthing = {
    enable = true;

    user = "oscarfaldi";
    dataDir = "/home/oscarfaldi";
    configDir = "/home/oscarfaldi/.config/syncthing";

    openDefaultPorts = true;
  };

{
  environment.systemPackages = with pkgs; [

    # Power button    
    wlogout

    # Keyboard mapping
    keyd

    # Network manager
    networkmanager

    # Editors & terminal utils
    git
    nano
    wget
    zsh
    zsh-autosuggestions
    pkgs.ghostty
    neovim
    vimPlugins.LazyVim`

    # Calculator
    gnome-calculator

    # Store credentials & password
    gnome-keyring

    # Audio center
    pavucontrol

    # PDF reader
    kdePackages.okular

    # Words, notes & sync
    xfce.mousepad
    onlyoffice-desktopeditors
    obsidian

    # Image compatibility
    ffmpeg
    ffmpegthumbnailer
    xfce.tumbler
    libwebp
    libavif
    librsvg

    # File manager & archive
    file-roller
    unzip
    p7zip
    unrar
    xdg-user-dirs

    # Terminal ecosystem
    zed
    fastfetch
    btop
    starship
    zoxide
    eza
    bat
    fzf
    ripgrep
    fd

    # Other tools
    gparted
    parabolic

    # Media
    mpv

    # Image viewer
    qimgv
  ];
}
