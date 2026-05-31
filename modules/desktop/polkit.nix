{ pkgs, ... }:

{
  # Enable PolicyKit system-wide.
  # Required for privilege escalation dialogs
  # such as mounting drives, editing system settings,
  # managing networking, and other admin actions.
  security.polkit.enable = true;

  # Install the GNOME authentication agent.
  # This provides graphical password prompts
  # when applications request elevated privileges.
  environment.systemPackages = [
    pkgs.polkit_gnome
  ];

  # Start the authentication agent automatically
  # when the user session begins.
  systemd.user.services.polkit-agent = {
    description = "PolicyKit Authentication Agent";

    # Start with the graphical user session.
    wantedBy = [ "default.target" ];

    serviceConfig = {
      # Keep the agent running continuously.
      Type = "simple";

      # Launch the GNOME PolicyKit agent.
      ExecStart =
        "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";

      # Automatically restart if the agent crashes.
      Restart = "on-failure";

      # Wait briefly before restarting.
      RestartSec = 1;
    };
  };
}
