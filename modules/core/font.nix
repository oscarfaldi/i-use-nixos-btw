{ config, pkgs, ... }:

{
  fonts = {
    packages = with pkgs; [
      # nerd fonts — terminal icons + patched variants
      nerd-fonts.iosevka-term-slab  # primary terminal font with nerd glyphs
      nerd-fonts.jetbrains-mono     # secondary terminal font with nerd glyphs

      # monospace — plain variants for editors/apps that don't need nerd glyphs
      jetbrains-mono
      ibm-plex                      # full IBM family: Sans, Serif, Mono, Condensed

      # ui / prose
      inter                         # clean modern sans-serif, good for UI

      # unicode coverage
      noto-fonts                    # latin, greek, cyrillic fallback
      noto-fonts-cjk-sans           # CJK fallback (Chinese, Japanese, Korean)
      noto-fonts-cjk-serif          # CJK serif fallback
      noto-fonts-color-emoji        # emoji
    ];

    fontconfig = {
      enable = true;
      defaultFonts = {
        monospace = [
          "IosevkaTermSlab Nerd Font"   # primary
          "JetBrains Mono"              # fallback
          "BlexMono Nerd Font"          # IBM Plex Mono fallback
        ];
        sansSerif = [
          "Inter"
          "IBM Plex Sans"
          "Noto Sans"
        ];
        serif = [
          "IBM Plex Serif"
          "Noto Serif"
        ];
        emoji = [
          "Noto Color Emoji"
        ];
      };
    };
  };
}
