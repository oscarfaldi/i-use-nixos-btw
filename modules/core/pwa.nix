{ pkgs, lib, ... }:

let
  mkPWA = { name, url, icon }:
    pkgs.makeDesktopItem {
      # Internal desktop entry name
      name = lib.strings.toLower name;

      # Displayed app name
      desktopName = name;

      # Force native Wayland Microsoft Edge PWA mode
      exec = "microsoft-edge --app=${url}";

      icon = icon;

      categories = [ "Network" ];
    };

in
{
  # Native Wayland support for Microsoft Edge and Electron apps
  environment.sessionVariables = { NIXOS_OZONE_WL = "1"; 
  };

  environment.systemPackages = with pkgs; [
    microsoft-edge

    (mkPWA {
      name = "ChatGPT";
      url = "https://chatgpt.com";
      icon = "/home/oscarfaldi/.system/assets/icons/chatgpt.svg";
    })

    (mkPWA {
      name = "Canva";
      url = "https://canva.com";
      icon = "/home/oscarfaldi/.system/assets/icons/canva.svg";
    })

    (mkPWA {
      name = "Gemini";
      url = "https://gemini.google.com";
      icon = "/home/oscarfaldi/.system/assets/icons/gemini.png";
    })

    (mkPWA {
      name = "WhatsApp";
      url = "https://web.whatsapp.com";
      icon = "/home/oscarfaldi/.system/assets/icons/whatsapp.svg";
    })

    (mkPWA {
      name = "Gmail";
      url = "https://mail.google.com";
      icon = "/home/oscarfaldi/.system/assets/icons/gmail.svg";
    })
  ];
}
