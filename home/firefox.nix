{ pkgs, ... }:

{
  # ==========================================================
  # Environment
  # ==========================================================

  home.sessionVariables = {
    MOZ_ENABLE_WAYLAND = "1";
  };

  # ==========================================================
  # Firefox
  # ==========================================================

  programs.firefox = {
    enable = true;

    # ========================================================
    # Enterprise Policies
    # ========================================================

    policies = {

      # ------------------------------------------------------
      # Privacy
      # ------------------------------------------------------

      DisableTelemetry = true;
      DisableFirefoxStudies = true;

      # ------------------------------------------------------
      # Mozilla Features
      # ------------------------------------------------------

      DisablePocket = true;

      # ------------------------------------------------------
      # Password Manager
      # ------------------------------------------------------

      PasswordManagerEnabled = true;
      OfferToSaveLogins = true;

      # ------------------------------------------------------
      # Firefox Home
      # ------------------------------------------------------

      FirefoxHome = {
        SponsoredTopSites = false;
        SponsoredPocket = false;
      };

      # ------------------------------------------------------
      # Search
      # ------------------------------------------------------

      SearchSuggestEnabled = true;

      # ------------------------------------------------------
      # Lock AI Features
      # ------------------------------------------------------

      Preferences = {

        "browser.ml.enable" = {
          Value = false;
          Status = "locked";
        };

        "browser.ml.chat.enabled" = {
          Value = false;
          Status = "locked";
        };
      };
    };

    # ========================================================
    # Profile
    # ========================================================

    profiles.default = {

      settings = {

        # ====================================================
        # AI
        # ====================================================

        "browser.ml.enable" = false;

        # ====================================================
        # Telemetry & Studies
        # ====================================================

        "toolkit.telemetry.enabled" = false;
        "datareporting.healthreport.uploadEnabled" = false;
        "app.shield.optoutstudies.enabled" = false;

        # ====================================================
        # Search & URL Bar
        # ====================================================

        "browser.search.suggest.enabled" = true;
        "browser.urlbar.suggest.searches" = true;

        # Disable Mozilla-sponsored suggestions
        "browser.urlbar.suggest.quicksuggest" = false;
        "browser.urlbar.suggest.quicksuggest.nonsponsored" = false;
        "browser.urlbar.suggest.quicksuggest.sponsored" = false;

        # ====================================================
        # Session Restore
        # ====================================================

        "browser.startup.page" = 3;

        # ====================================================
        # Scrolling
        # ====================================================

        "general.smoothScroll" = false;

        # ====================================================
        # New Tab
        # ====================================================

        # Remove sponsored content
        "browser.newtabpage.activity-stream.showSponsored" = false;
        "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;

        # Remove Mozilla content feeds
        "browser.newtabpage.activity-stream.feeds.section.topstories" = false;
        "browser.newtabpage.activity-stream.feeds.topsites" = false;

        # ====================================================
        # Passwords & Autofill
        # ====================================================

        "signon.rememberSignons" = true;

        "extensions.formautofill.addresses.enabled" = true;
        "extensions.formautofill.creditCards.enabled" = false;

        # ====================================================
        # DNS-over-HTTPS
        # ====================================================

        # Cloudflare
        "network.trr.mode" = 3;
        "network.trr.uri" =
          "https://cloudflare-dns.com/dns-query";

        # ====================================================
        # GTK Integration
        # ====================================================

        "widget.gtk.rounded-bottom-corners.enabled" = true;

        # ====================================================
        # Tabs
        # ====================================================

        # Don't close entire window when last tab closes
        "browser.tabs.closeWindowWithLastTab" = false;

        # Hide Firefox View button
        "browser.tabs.firefox-view" = false;

        # ====================================================
        # Downloads
        # ====================================================

        "browser.download.useDownloadDir" = true;

        # ====================================================
        # Pocket
        # ====================================================

        "extensions.pocket.enabled" = false;

        # ====================================================
        # Shopping
        # ====================================================

        "browser.shopping.experience2023.enabled" = false;

        # ====================================================
        # Reader View
        # ====================================================

        "reader.parse-on-load.enabled" = false;
      };
    };
  };
}
