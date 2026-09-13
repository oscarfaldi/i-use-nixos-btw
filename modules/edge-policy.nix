{ ... }:

{
  environment.etc."opt/edge/policies/managed/policies.json".text = ''
    {
      "PasswordManagerEnabled": true,
      "AutofillAddressEnabled": false,
      "AutofillCreditCardEnabled": false,

      "DnsOverHttpsMode": "secure",
      "DnsOverHttpsTemplates": "https://cloudflare-dns.com/dns-query",

      "BackgroundModeEnabled": false,
      "ShoppingListEnabled": false,

      "MetricsReportingEnabled": false,

      "DefaultSearchProviderEnabled": true,
      "DefaultSearchProviderName": "DuckDuckGo",
      "DefaultSearchProviderKeyword": "ddg",
      "DefaultSearchProviderSearchURL": "https://duckduckgo.com/?q={searchTerms}",
      "DefaultSearchProviderSuggestURL": "https://duckduckgo.com/ac/?q={searchTerms}&type=list"
    }
  '';
}
