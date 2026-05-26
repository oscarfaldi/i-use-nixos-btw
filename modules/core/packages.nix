{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [

    # Editors & terminal utils
    git
    nano
    wget

    # Audio center
    pavucontrol

    # Browser
    brave

    # PDF reader
    kdePackages.okular

    # Notes & sync
    mousepad
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
