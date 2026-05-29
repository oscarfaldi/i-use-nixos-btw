{ ... }:

{
  # Deploy GTK bookmarks and GTK settings

  home.file.".config/gtk-3.0".source =
    ../dotfiles/gtk-3.0;
}
