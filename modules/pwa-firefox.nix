{ pkgs, lib, ... }:

let
  mkWebApp = { name, url, icon }:
    pkgs.makeDesktopItem {
      # Internal desktop entry name
      name = lib.strings.toLower name;

      # Displayed app name
      desktopName = name;

      # Launch URL in Firefox
      exec = "pwa ${url}";

      icon = icon;

      categories = [ "Network" ];
    };

in
{
  environment.systemPackages = with pkgs; [

    (mkWebApp {
      name = "ChatGPT";
      url = "https://chatgpt.com";
      icon = "/home/oscarfaldi/.config/assets/icons/pwa/chatgpt.svg";
    })

    (mkWebApp {
      name = "Open WebUI";
      url = "http://10.10.10.10:8072/";
      icon = "/home/oscarfaldi/.config/assets/icons/pwa/openwebui.svg";
    })

    (mkWebApp {
      name = "Canva";
      url = "https://canva.com";
      icon = "/home/oscarfaldi/.config/assets/icons/pwa/canva.svg";
    })

    (mkWebApp {
      name = "Gemini";
      url = "https://gemini.google.com";
      icon = "/home/oscarfaldi/.config/assets/icons/pwa/gemini.svg";
    })

    (mkWebApp {
      name = "Claude";
      url = "https://claude.ai";
      icon = "/home/oscarfaldi/.config/assets/icons/pwa/claude.svg";
    })

    (mkWebApp {
      name = "Unraid";
      url = "http://10.10.10.10:8081/";
      icon = "/home/oscarfaldi/.config/assets/icons/pwa/unraid.svg";
    })

    (mkWebApp {
      name = "WhatsApp";
      url = "https://web.whatsapp.com";
      icon = "/home/oscarfaldi/.config/assets/icons/pwa/whatsapp.svg";
    })

    (mkWebApp {
      name = "Wordpress";
      url = "https://oscarfaldi.com/wp-admin";
      icon = "/home/oscarfaldi/.config/assets/icons/pwa/wordpress.svg";
    })

    (mkWebApp {
      name = "Jellyfin";
      url = "http://10.10.10.10:8096/";
      icon = "/home/oscarfaldi/.config/assets/icons/pwa/jellyfin.svg";
    })

    (mkWebApp {
      name = "Navidrome";
      url = "http://10.10.10.10:4533/";
      icon = "/home/oscarfaldi/.config/assets/icons/pwa/navidrome.svg";
    })

    (mkWebApp {
      name = "Grafana";
      url = "http://10.10.10.10:3050/";
      icon = "/home/oscarfaldi/.config/assets/icons/pwa/grafana.svg";
    })

    (mkWebApp {
      name = "Gmail";
      url = "https://mail.google.com";
      icon = "/home/oscarfaldi/.config/assets/icons/pwa/gmail.svg";
    })
  ];
}
