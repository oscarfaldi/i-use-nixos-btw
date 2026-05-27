{ pkgs, ... }:

let
  mkPWA = name: url:
    pkgs.makeDesktopItem {
      name = builtins.toLower name;
      desktopName = name;

      # Open as dedicated app window
      exec = "chromium --app=${url}";

      icon = "chromium";

      categories = [ "Network" ];
    };

in
{
  environment.systemPackages = with pkgs; [
    chromium

    # Dedicated web apps
    (mkPWA "ChatGPT" "https://chatgpt.com")
    (mkPWA "WhatsApp" "https://web.whatsapp.com")
    (mkPWA "Gmail" "https://mail.google.com")
  ];
}
