{ config, pkgs, ... }:

let
autoLogin = false;
username = "oscarfaldi";
in
{
services.greetd = {
enable = true;

settings.default_session =
  if autoLogin then {
    user = username;
    command = "niri-session";
  } else {
    user = "greeter";
    command = "${pkgs.tuigreet}/bin/tuigreet \
      --time \
      --remember \
      --remember-user-session \
      --cmd niri-session";
  };

};

environment.systemPackages = with pkgs; [
tuigreet
];
}
