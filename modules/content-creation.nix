{ pkgs, ... }:

{
  environment.systemPackages = [
    # ============================================================
    # Video Editing
    # ============================================================
    pkgs.kdePackages.kdenlive

    # ============================================================
    # AI Subtitle Generation
    # ============================================================
    (pkgs.python313.withPackages (ps: [
      ps.faster-whisper
    ]))
  ];
}
