{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [

    # Editors & terminal utils
    git
    nano
    wget

    # Browser
    brave

    # PDF reader
    okular

    # Notes & sync
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
