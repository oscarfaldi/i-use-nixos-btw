# ==============================================================================
# Home Manager File Declarations
# ==============================================================================
# This module declaratively links user configuration files and directories from
# the local dotfiles repository into the user's home directory.
#
# Sections:
# - Core Shell & Terminal Environment
# - System Interface & Wayland Compositor (Niri)
# - Applications, Viewers & Media Tools
# - Desktop Automation, Security & Utilities
# ==============================================================================

{ config, pkgs, ... }:

{
  home.file = {

    # --------------------------------------------------------------------------
    # Core Shell & Terminal Environment
    # --------------------------------------------------------------------------
    ".config/zsh/.zshrc".source       = ../.config/zsh/.zshrc;
    ".config/aliasrc".source          = ../.config/aliasrc;
    ".config/starship.toml".source    = ../.config/starship.toml;
    ".config/fastfetch".source        = ../.config/fastfetch;
    ".config/ghostty".source          = ../.config/ghostty;

    # --------------------------------------------------------------------------
    # System Interface & Wayland Compositor (Niri)
    # --------------------------------------------------------------------------
    ".config/niri".source             = ../.config/niri;
    ".config/waybar".source           = ../.config/waybar;
    ".config/fuzzel".source           = ../.config/fuzzel;
    ".config/mako".source             = ../.config/mako;
    ".config/wlogout".source          = ../.config/wlogout;
    ".config/assets".source           = ../.config/assets;

    # --------------------------------------------------------------------------
    # Applications, Viewers & Media Tools
    # --------------------------------------------------------------------------
    ".config/yazi".source             = ../.config/yazi;
    ".config/mpv".source              = ../.config/mpv;
    ".config/qimgv".source            = ../.config/qimgv;
    ".config/pdfarranger".source      = ../.config/pdfarranger;
    ".config/xarchiver".source        = ../.config/xarchiver;
    ".config/libreoffice/4/user/registrymodifications.xcu".source =
      ../.config/libreoffice/4/user/registrymodifications.xcu;

    # --------------------------------------------------------------------------
    # Desktop Automation, Security & Utilities
    # --------------------------------------------------------------------------
    ".config/swaylock".source          = ../.config/swaylock;
    ".config/swayidle".source          = ../.config/swayidle;
    ".config/Thunar".source            = ../.config/Thunar;
    ".config/qalculate".source         = ../.config/qalculate;
    ".config/gtk-3.0/bookmarks".source = ../.config/gtk-3.0/bookmarks;
    ".config/mimeapps.list".source     = ../.config/mimeapps.list;
    
    # System Integration
    ".config/xdg-desktop-portal".source = ../.config/xdg-desktop-portal;
    ".local/share/applications".source  = ../.local/share/applications;

  };
}
