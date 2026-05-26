{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [

    # Fonts
    nerd-fonts.jetbrains-mono
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji-blob-bin
    jetbrains-mono
  ];
};
