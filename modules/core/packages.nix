{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [

    # Power button    
    wlogout

    # Keyboard mapping
    keyd

    # Network manager
    networkmanagerapplet

    # Editors & terminal utils
    git
    nano
    wget
    zsh
    alacritty
    neovim
    vimPlugins.LazyVim

    # NFS compatibility
    gvfs
    nfs-utils
    cifs-utils

    # Audio center
    pavucontrol

    # PDF reader
    kdePackages.okular

    # Words, notes & sync
    xfce.mousepad
    onlyoffice-desktopeditors
    obsidian
    syncthing

    # Image compatibility
    ffmpeg
    ffmpegthumbnailer
    xfce.tumbler
    libwebp
    libavif

    # File manager & archive
    file-roller
    unzip
    p7zip
    unrar
    xdg-user-dirs

    # Terminal ecosystem
    fastfetch
    btop
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
