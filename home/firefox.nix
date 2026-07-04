{ pkgs, ... }:

{
  home.sessionVariables = {
    MOZ_ENABLE_WAYLAND = "1";
  };

  programs.firefox = {
    enable = true;

    profiles.default = {

      settings = {

        # ======================================================
        # AI
        # ======================================================

        "browser.ml.enable" = false;

        # ======================================================
        # Telemetry & Studies
        # ======================================================

        "toolkit.telemetry.enabled" = false;
        "datareporting.healthreport.uploadEnabled" = false;
        "app.shield.optoutstudies.enabled" = false;

        # ======================================================
        # Firefox Suggestions
        # ======================================================

        "browser.search.suggest.enabled" = true;
        "browser.urlbar.suggest.searches" = true;

        "browser.urlbar.suggest.quicksuggest" = false;
        "browser.urlbar.suggest.quicksuggest.nonsponsored" = false;
        "browser.urlbar.suggest.quicksuggest.sponsored" = false;

        # ======================================================
        # Session Restore
        # ======================================================

        "browser.startup.page" = 3;

        # ======================================================
        # Scrolling
        # ======================================================

        "general.smoothScroll" = false;

        # ======================================================
        # New Tab
        # ======================================================

        "browser.newtabpage.activity-stream.showSponsored" = false;
        "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;

        "browser.newtabpage.activity-stream.feeds.section.topstories" = false;
        "browser.newtabpage.activity-stream.feeds.topsites" = false;

        # ======================================================
        # Passwords & Autofill
        # ======================================================

        "signon.rememberSignons" = true;

        "extensions.formautofill.addresses.enabled" = true;
        "extensions.formautofill.creditCards.enabled" = false;

        # ======================================================
        # DNS-over-HTTPS
        # ======================================================

        "network.trr.mode" = 3;
        "network.trr.uri" =
          "https://cloudflare-dns.com/dns-query";

        # ======================================================
        # GTK Integration
        # ======================================================

        "widget.gtk.rounded-bottom-corners.enabled" = true;

        # ======================================================
        # Tabs
        # ======================================================

        "browser.tabs.closeWindowWithLastTab" = false;

        # ======================================================
        # Downloads
        # ======================================================

        "browser.download.useDownloadDir" = true;

        # ======================================================
        # Pocket
        # ======================================================

        "extensions.pocket.enabled" = false;

        # ======================================================
        # Firefox View
        # ======================================================

        "browser.tabs.firefox-view" = false;

        # ======================================================
        # Shopping
        # ======================================================

        "browser.shopping.experience2023.enabled" = false;

        # ======================================================
        # Reader View
        # ======================================================

        "reader.parse-on-load.enabled" = false;
      };
    };
  };
}
