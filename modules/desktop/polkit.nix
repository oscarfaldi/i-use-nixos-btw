{ pkgs, ... }:

{

# Privilege escalation framework

security.polkit.enable = true;

# GNOME authentication dialog

environment.systemPackages = with pkgs; [
polkit_gnome
];
}
