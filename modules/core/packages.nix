{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [

    # Editors & terminal utils
    git
    nano
    wget
    alacritty
    neovim
    vimPlugins.LazyVim

    # NFS compatibility
    nfs-utils
    gvfs-nfs
    gvfs

    # Audio center
    pavucontrol

    # Browser
    brave

    # PDF reader
    kdePackages.okular

    # Words, notes & sync
    mousepad
    onlyoffice-desktopeditors
    obsidian
    syncthing

    # Image compatibility
    libwebp
    libavif

    # File manager & archive
    file-roller
    unzip
    p7zip
    unrar

    # Terminal ecosystem
    fastfetch
    btop
    zoxide
    eza
    bat
    fzf
    ripgrep
    fd

    # Media
    mpv

    # Image viewer
    qimgv
  ];
}
