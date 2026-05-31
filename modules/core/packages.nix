{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [

    # Power button    
    wlogout

    # Keyboard mapping
    keyd

    # Network manager
    networkmanager
    networkmanagerapplet

    # Editors & terminal utils
    git
    nano
    wget
    zsh
    zsh-autosuggestions
    alacritty
    neovim
    vimPlugins.LazyVim`

    # Calculator
    gnome-calculator

    # NFS compatibility
    gvfs

    # Store credentials & password
    gnome-keyring

    # Audio center
    pwvucontrol

    # PDF reader
    kdePackages.okular

    # Words, notes & sync
    gnome-text-editor
    onlyoffice-desktopeditors
    obsidian
    syncthing

    # Image compatibility
    ffmpeg
    ffmpegthumbnailer
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
    loupe
  ];
}
