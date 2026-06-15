{ config, pkgs, ... }:

{
  home.file.".config/assets".source = ../.config/assets;
  home.file.".config/fastfetch".source = ../.config/fastfetch;
  home.file.".config/fuzzel".source = ../.config/fuzzel;
  home.file.".config/ghostty".source = ../.config/ghostty;

  home.file.".config/gtk-3.0".source = ../.config/gtk-3.0;
  home.file.".config/gtk-4.0".source = ../.config/gtk-4.0;

  home.file.".config/mako".source = ../.config/mako;
  home.file.".config/mpv".source = ../.config/mpv;
  home.file.".config/niri".source = ../.config/niri;
  home.file.".config/pdfarranger".source = ../.config/pdfarranger;
  home.file.".config/qimgv".source = ../.config/qimgv;

  home.file.".config/swayidle".source = ../.config/swayidle;
  home.file.".config/swaylock".source = ../.config/swaylock;

  home.file.".config/tumbler".source = ../.config/tumbler;

  home.file.".config/waybar".source = ../.config/waybar;
  home.file.".config/wallust".source = ../.config/wallust;
  home.file.".config/wlogout".source = ../.config/wlogout;
  home.file.".config/xarchiver".source = ../.config/xarchiver;

  home.file.".config/xfconf".source =
    ../.config/xfconf;

  home.file.".config/yazi".source =
    ../.config/yazi;

  home.file.".config/aliasrc".source =
    ../.config/aliasrc;

  home.file.".config/zsh".source =
    ../.config/zsh;

  home.file.".config/starship.toml".source =
    ../.config/starship.toml;

  home.file.".config/mimeapps.list".source =
    ../.config/mimeapps.list;
}
