#!/usr/bin/env bash

set -e

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo " Switching to unstable..."
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━"

sudo nix-channel --remove nixos 2>/dev/null || true

sudo nix-channel --add 
https://channels.nixos.org/nixos-unstable 
nixos

sudo nix-channel --update

echo
echo "✓ Unstable channel enabled."
echo

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo " Rebuilding system..."
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━"

sudo nixos-rebuild switch

echo
echo "✓ System rebuilt."
echo

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo " Installing dotfiles..."
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━"

mkdir -p ~/.config

cp -rf dotfiles/* ~/.config/

echo
echo "✓ Dotfiles installed."
echo

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo " Installing helper scripts..."
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━"

mkdir -p ~/.local/bin

for script in scripts/*; do
    chmod +x "$script"
    ln -sf "$(pwd)/$script" ~/.local/bin/$(basename "$script")

echo
echo "✓ Scripts installed."
echo

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo " Applying theme..."
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━"

gsettings set org.gnome.desktop.interface gtk-theme Graphite-Dark
gsettings set org.gnome.desktop.interface icon-theme Papirus-Dark
gsettings set org.gnome.desktop.interface cursor-theme Bibata-Modern-Ice
gsettings set org.gnome.desktop.interface color-scheme prefer-dark

echo
echo "✓ Theme applied."
echo

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo " Cleaning NetworkManager..."
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━"

for i in 1 2 3; do
    nmcli connection delete "Wired connection $i" 2>/dev/null || true
done

echo
echo "✓ NetworkManager cleaned."
echo

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo " Cleaning old generations..."
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━"

sudo nix-collect-garbage -d

echo
echo "✓ Garbage collection complete."
echo
echo "Bootstrap complete."
