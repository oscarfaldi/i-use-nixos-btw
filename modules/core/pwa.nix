{ pkgs, lib, ... }:

let
  mkPWA = name: url:
    pkgs.makeDesktopItem {
      name = lib.strings.toLower name;

      desktopName = name;

      # Open website as dedicated app window
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
