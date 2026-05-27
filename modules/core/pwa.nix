{ pkgs, ... }:

let
  setupPWAs = pkgs.writeShellScriptBin "setup-pwas" ''
    # Install Firefox PWA runtime
    firefoxpwa runtime install

    # Create PWAs
    firefoxpwa site install https://chatgpt.com \
      --name "ChatGPT"

    firefoxpwa site install https://web.whatsapp.com \
      --name "WhatsApp"

    firefoxpwa site install https://gmail.com \
      --name "Gmail"
  '';
in
{
  environment.systemPackages = with pkgs; [
    firefox
    firefoxpwa
    setupPWAs
  ];
}
