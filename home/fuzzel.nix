{ ... }:

{
  # ============================================================
  # Fuzzel
  # ============================================================

  programs.fuzzel = {
    enable = true;

    settings = {
      main = {
        font = "JetBrainsMono Nerd Font:size=13";
        dpi-aware = "auto";
        prompt = "";
        icons-enabled = true;
        fields = "filename,name,generic";
        password-character = "*";
        filter-desktop = false;
        match-mode = "fzf";
        show-actions = false;

        # Layout
        anchor = "center";
        lines = 10;
        width = 45;
        tabs = 4;
        horizontal-pad = 18;
        vertical-pad = 8;
        inner-pad = 0;
        image-size-ratio = 0.5;
        line-height = 30;
        letter-spacing = 0;
        layer = "top";
        exit-on-keyboard-focus-loss = true;
      };

      # Border
      border = {
        width = 2;
        radius = 0;
      };
    };
  };
}
