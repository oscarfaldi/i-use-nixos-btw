{ ... }:

{
  # Deploy btop configuration

  home.file.".config/btop".source =
    ../dotfiles/btop;
}
