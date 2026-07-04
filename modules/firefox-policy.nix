{ ... }:

{
  programs.firefox = {
    enable = true;

    policies = {
      # ==========================================================
      # Privacy
      # ==========================================================

      DisableTelemetry = true;
      DisableFirefoxStudies = true;

      # ==========================================================
      # Mozilla Features
      # ==========================================================

      DisablePocket = true;

      # ==========================================================
      # Passwords
      # ==========================================================

      PasswordManagerEnabled = true;
      OfferToSaveLogins = true;

      # ==========================================================
      # UI
      # ==========================================================

      DisplayBookmarksToolbar = "never";

      # ==========================================================
      # Search
      # ==========================================================

      SearchSuggestEnabled = true;

      FirefoxHome = {
        SponsoredTopSites = false;
        SponsoredPocket = false;
      };
    };
  };
}
