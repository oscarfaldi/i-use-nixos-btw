{ config, pkgs, ... }:

{
  # Enable gnome keyring for passwords and credentials
  services.gnome.gnome-keyring.enable = true;

  # Syncthing file synchronization service
  # services.syncthing = {
    # enable = true;
    # user = "oscarfaldi";
    # dataDir = "/home/oscarfaldi";
    # configDir = "/home/oscarfaldi/.config/syncthing";
    # openDefaultPorts = true;
  # };

programs.bash = {
  completion.enable = true;
};

  environment.systemPackages = with pkgs; [
    
    # Power button    
    wlogout

    # Default apps
    xdg-utils

    # Editors & terminal utils
    git
    nano
    wget
    bash
    bash-completion
    ghostty
    neovim
    vimPlugins.LazyVim

    # Calculator
    gnome-calculator

    # Audio center
    pwvucontrol

    # Network manager
    networkmanagerapplet

    # PDF reader
    kdePackages.okular

    # Words, notes & sync
    mousepad
    onlyoffice-desktopeditors
    # obsidian

    # Media and doc compatibility
    ffmpeg
    ffmpegthumbnailer
    libwebp
    libavif
    librsvg
    libgepub
    libopenraw
    libgsf

    # File manager & archive
    xdg-user-dirs-gtk
    file-roller
    unzip
    p7zip
    unrar

    # Terminal ecosystem
    zed
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
    procs
    dust
    man-pages
    man-pages-posix

    # Other tools
    gparted
    parabolic

    # Media
    mpv

    # Image viewer
    loupe
  ];
}
