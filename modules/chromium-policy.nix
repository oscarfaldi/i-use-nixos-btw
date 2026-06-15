{ ... }:

{
  environment.etc."chromium/policies/managed/policies.json".text = ''
    {
      "PasswordManagerEnabled": false,

      "DnsOverHttpsMode": "secure",
      "DnsOverHttpsTemplates": "https://cloudflare-dns.com/dns-query",

      "BackgroundModeEnabled": false,
      "ShoppingListEnabled": false,

      "MetricsReportingEnabled": false
    }
  '';
}
