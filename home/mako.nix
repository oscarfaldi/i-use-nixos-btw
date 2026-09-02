{ ... }:

{
  services.mako = {
    enable = true;

    settings = {
      # ========================================================
      # Notification Sounds
      # ========================================================

      "on-notify" = "exec pw-play /home/oscarfaldi/.config/assets/sounds/positive.ogg";

      # ========================================================
      # Appearance
      # ========================================================

      font = "JetBrainsMono Nerd Font 11";

      width = 375;
      height = 200;

      margin = 20;
      padding = 12;

      border-size = 3;
      border-radius = 0;

      icons = true;
      max-icon-size = 50;

      markup = true;

      # ========================================================
      # Layout
      # ========================================================

      output = "Lenovo Group Limited R27q-30 U533HP7K";
      layer = "overlay";
      anchor = "top-center";

      sort = "-time";

      max-visible = 8;
      "group-by" = "none";

      # ========================================================
      # Behavior
      # ========================================================

      "default-timeout" = 5000;
      "ignore-timeout" = true;

      actions = true;

      format = "<b>%a</b>\\n%s\\n%b";

      # ========================================================
      # Filters
      # ========================================================

      "app-name=lightcord summary~=\"(.*(^| )orz|ORZ|sto|STO|otl|OTL( |$).*)\"" = {
        invisible = true;
      };

      # ========================================================
      # Urgency Rules
      # ========================================================

      "urgency=high" = {
        "default-timeout" = 0;
        "on-notify" = "exec pw-play /home/oscarfaldi/.config/assets/sounds/negative.ogg";
      };

      "urgency=critical" = {
        "default-timeout" = 0;
        "on-notify" = "exec pw-play /home/oscarfaldi/.config/assets/sounds/negative.ogg";
      };
    };
  };
}
