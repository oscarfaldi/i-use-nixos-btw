programs.chromium = {
  enable = true;

  extensions = [
    { id = "nngceckbapebfimnlniiiahkandclblb"; } # Bitwarden
    { id = "mnjggcdmjocbbbhaepdhchncahnbgone"; } # uBlock Origin Lite
    { id = "ldgfbffkinooeloadekpmfoklnobpien"; } # Raindrop.io
    { id = "olenolhfominlkfmlkolcahemogebpcj"; } # Fast Save and Repost for Instagram
  ];

  commandLineArgs = [
    "--disable-smooth-scrolling"
    "--disable-features=TabHoverCardImages"
    "--enable-features=VaapiVideoDecoder"
    "--ignore-gpu-blocklist"
  ];

  extraOpts = {
    # Bitwarden replaces Chromium password manager
    PasswordManagerEnabled = false;

    # Disable autofill junk
    AutofillAddressEnabled = false;
    AutofillCreditCardEnabled = false;

    # Session restore
    RestoreOnStartup = 1;

    # Disable shopping features
    ShoppingListEnabled = false;

    # Cloudflare DNS-over-HTTPS
    DnsOverHttpsMode = "secure";
    DnsOverHttpsTemplates = "https://cloudflare-dns.com/dns-query";

    # Reduce telemetry
    MetricsReportingEnabled = false;

    # Don't keep Chromium alive after closing
    BackgroundModeEnabled = false;
  };
};
