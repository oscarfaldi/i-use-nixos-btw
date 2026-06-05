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
    chromium

    (mkPWA {
      name = "ChatGPT";
      url = "https://chatgpt.com";
      icon = "/etc/nixos/assets/icons/chatgpt.svg";
    })

    (mkPWA {
      name = "Canva";
      url = "https://canva.com";
      icon = "/etc/nixos/assets/icons/canva.svg";
    })

    (mkPWA {
      name = "Gemini";
      url = "https://gemini.google.com";
      icon = "/etc/nixos/assets/icons/gemini.png";
    })

    (mkPWA {
      name = "Claude";
      url = "https://claude.ai";
      icon = "/etc/nixos/assets/icons/claude.svg";
    })

    (mkPWA {
      name = "Unraid";
      url = "http://10.10.10.10:8081/";
      icon = "/etc/nixos/assets/icons/unraid.svg";
    })

    (mkPWA {
      name = "WhatsApp";
      url = "https://web.whatsapp.com";
      icon = "/etc/nixos/assets/icons/whatsapp.svg";
    })

    (mkPWA {
      name = "Wordpress";
      url = "https://oscarfaldi.com/wp-admin";
      icon = "/etc/nixos/assets/icons/wordpress.svg";
    })

    (mkPWA {
      name = "Jellyfin";
      url = "http://10.10.10.10:8096";
      icon = "/etc/nixos/assets/icons/jellyfin.svg";
    })

    (mkPWA {
      name = "Grafana";
      url = "http://10.10.10.10:3050/";
      icon = "/etc/nixos/assets/icons/grafana.svg";
    })

    (mkPWA {
      name = "Gmail";
      url = "https://mail.google.com";
      icon = "/etc/nixos/assets/icons/gmail.svg";
    })
  ];
}
