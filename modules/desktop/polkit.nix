{ config, pkgs, ... }:

{
  # polkit framework — required for privilege escalation dialogs
  security.polkit.enable = true;

  # user-level systemd service — starts mate polkit agent with the graphical session
  systemd.user.services.mate-polkit = {
    description = "MATE Polkit Authentication Agent";
    wantedBy = [ "graphical-session.target" ];  # start when graphical session is active
    wants = [ "graphical-session.target" ];      # soft dependency on graphical session
    after = [ "graphical-session.target" ];      # don't start before graphical session is up
    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.mate.mate-polkit}/libexec/polkit-mate-authentication-agent-1";
      Restart = "on-failure";   # revive if it crashes
      RestartSec = 1;           # wait 1s before restart
      TimeoutStopSec = 10;      # force kill after 10s if it hangs on stop
    };
  };

  # make the binary available on the system
  environment.systemPackages = with pkgs; [
    mate.mate-polkit
  ];
}
