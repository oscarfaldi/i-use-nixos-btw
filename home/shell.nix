{ config, pkgs, ... }:

{
  # ============================================================
  # Zsh
  # ============================================================

  programs.zsh = {
    enable = true;
    dotDir = "${config.xdg.configHome}/zsh";

    initContent = ''
      # Aliases
      [ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"

      # Smart directory jumping
      command -v zoxide >/dev/null && eval "$(zoxide init zsh)"
    '';
  };

  # ============================================================
  # Starship
  # ============================================================

  programs.starship.enable = true;
}
