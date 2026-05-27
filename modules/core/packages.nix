{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [

    # Power button    
    wlogout

    # Editors & terminal utils
    git
    nano
    wget
    zsh
    alacritty
    neovim
    vimPlugins.LazyVim

    # NFS compatibility
    nfs-utils
    gvfs

    # Audio center
    pavucontrol

    # Browser
    brave

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

    # Media
    mpv

    # Image viewer
    qimgv
  ];
}
