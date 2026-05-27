{ pkgs, lib, ... }:

let
  mkPWA = { name, url, icon }:
    pkgs.makeDesktopItem {
      name = lib.strings.toLower name;

      desktopName = name;

      exec = "chromium --app=${url}";

      icon = icon;

      categories = [ "Network" ];
    };

in
{
  environment.systemPackages = with pkgs; [
    chromium

    (mkPWA {
      name = "ChatGPT";
      url = "https://chatgpt.com";
      icon = "/etc/nixos/assets/icons/chatgpt.png";
    })

    (mkPWA {
      name = "WhatsApp";
      url = "https://web.whatsapp.com";
      icon = "/etc/nixos/assets/icons/whatsapp.png";
    })

    (mkPWA {
      name = "Gmail";
      url = "https://mail.google.com";
      icon = "/etc/nixos/assets/icons/gmail.png";
    })
  ];
}
