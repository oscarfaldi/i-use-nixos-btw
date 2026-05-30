{ ... }:

{
  # Deploy waybar configuration

  home.file.".config/waybar".source =
    ../dotfiles/waybar;
}
