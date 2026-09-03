{ ... }:

{
  programs.waybar = {
    enable = true;

    settings = [
      {
        layer = "top";
        position = "top";

        margin-top = 13;
        margin-left = 13;
        margin-right = 13;

        modules-left = [
          "custom/logo"
          "niri/workspaces"
        ];

        modules-center = [
          "clock"
        ];

        modules-right = [
          "cpu"
          "memory"
          "pulseaudio"
          "tray"
          "custom/updates"
          "custom/power"
        ];

        "custom/logo" = {
          format = "💰 Oscar Faldi";
          tooltip = false;
        };

        "niri/workspaces" = {
          format = "{value}";
        };

        clock = {
          format = "{:%A, %d %B %Y | %H:%M}";
          tooltip-format = "<tt>{calendar}</tt>";

          calendar = {
            mode = "month";
          };
        };

        cpu = {
          interval = 2;
          format = " {usage}%";
        };

        memory = {
          interval = 2;
          format = "󰍛 {used:0.1f}G";
        };

        pulseaudio = {
          format = "{icon}  {volume}%";
          format-muted = "󰝟";

          format-icons = {
            default = [
              ""
              ""
              ""
            ];
          };

          on-click = "pwvucontrol";
        };

        tray = {
          spacing = 18;
        };

        "custom/updates" = {
          format = "[ Update ]";
          tooltip = "Upgrade System";
          on-click = "ghostty -e upgrade";
        };

        "custom/power" = {
          format = "[  ⏻  ]";
          tooltip = false;
          on-click = "wlogout";
        };
      }
    ];
  };
}
