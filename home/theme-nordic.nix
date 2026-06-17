{ ... }:

{
  # ============================================================
  # Nordic GTK Theme
  # ============================================================

  gtk = {
    enable = true;

    theme.name = "Nordic";

    iconTheme.name = "Papirus-Dark";

    cursorTheme.name = "Bibata-Modern-Ice";

    font = {
      name = "JetBrainsMono Nerd Font";
      size = 11;
    };
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };
}
