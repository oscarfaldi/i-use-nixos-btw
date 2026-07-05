{ ... }:

{
  environment.etc."chromium/policies/managed/policies.json".text = ''
    {
      "PasswordManagerEnabled": false,
      "AutofillAddressEnabled": false,
      "AutofillCreditCardEnabled": false,

      "DnsOverHttpsMode": "secure",
      "DnsOverHttpsTemplates": "https://cloudflare-dns.com/dns-query",

      "BackgroundModeEnabled": false,
      "ShoppingListEnabled": false,

      "MetricsReportingEnabled": false,

      "NewTabPageLocation": "about:blank"
    }
  '';
}
