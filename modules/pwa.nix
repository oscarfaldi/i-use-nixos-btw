{ pkgs, lib, ... }:

let
  mkPWA = { name, url, icon }:
    pkgs.makeDesktopItem {
      # Internal desktop entry name
      name = lib.strings.toLower name;

      # Displayed app name
      desktopName = name;

      # Force native Wayland Chromium PWA mode
      exec = "chromium --app=${url}";

      icon = icon;

      categories = [ "Network" ];
    };

in
{
  # Native Wayland support for Chromium and Electron apps
  environment.sessionVariables = { NIXOS_OZONE_WL = "1"; 
  };

  environment.systemPackages = with pkgs; [

    (mkPWA {
      name = "ChatGPT";
      url = "https://chatgpt.com";
      icon = "/home/oscarfaldi/.config/assets/icons/chatgpt.svg";
    })

    (mkPWA {
      name = "Canva";
      url = "https://canva.com";
      icon = "/home/oscarfaldi/.config/assets/icons/canva.svg";
    })

    (mkPWA {
      name = "Gemini";
      url = "https://gemini.google.com";
      icon = "/home/oscarfaldi/.config/assets/icons/gemini.png";
    })

    (mkPWA {
      name = "Claude";
      url = "https://claude.ai";
      icon = "/home/oscarfaldi/.config/assets/icons/claude.svg";
    })

    (mkPWA {
      name = "Unraid";
      url = "http://10.10.10.10:8081/";
      icon = "/home/oscarfaldi/.config/assets/icons/unraid.svg";
    })

    (mkPWA {
      name = "WhatsApp";
      url = "https://web.whatsapp.com";
      icon = "/home/oscarfaldi/.config/assets/icons/whatsapp.svg";
    })

    (mkPWA {
      name = "Wordpress";
      url = "https://oscarfaldi.com/wp-admin";
      icon = "/home/oscarfaldi/.config/assets/icons/wordpress.svg";
    })

    (mkPWA {
      name = "Jellyfin";
      url = "http://10.10.10.10:8096/";
      icon = "/home/oscarfaldi/.config/assets/icons/jellyfin.svg";
    })

    (mkPWA {
      name = "Navidrome";
      url = "http://10.10.10.10:4533/";
      icon = "/home/oscarfaldi/.config/assets/icons/navidrome.svg";
    })

    (mkPWA {
      name = "Obsidian";
      url = "http://10.10.10.10:3001/";
      icon = "/home/oscarfaldi/.config/assets/icons/obsidian.svg";
    })

    (mkPWA {
      name = "Grafana";
      url = "http://10.10.10.10:3050/";
      icon = "/home/oscarfaldi/.config/assets/icons/grafana.svg";
    })

    (mkPWA {
      name = "Gmail";
      url = "https://mail.google.com";
      icon = "/home/oscarfaldi/.config/assets/icons/gmail.svg";
    })
  ];
}
