{ config, pkgs, ... }:

{
  # --------------------------------------------------
  # PipeWire Audio and Low-Latency Scheduling
  # --------------------------------------------------

  security.rtkit.enable = true;

  services.pipewire = {
    enable = true;

    # ALSA Support
    alsa.enable = true;
    alsa.support32Bit = true;

    # PulseAudio Compatibility Layer
    pulse.enable = true;

    # Session and Device Manager
    wireplumber.enable = true;
  };
}
