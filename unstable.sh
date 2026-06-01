#!/usr/bin/env bash

set -e

echo "Switching NixOS channel to unstable..."

sudo nix-channel --remove nixos 2>/dev/null || true

sudo nix-channel --add 
https://channels.nixos.org/nixos-unstable 
nixos

echo "Updating channels..."

sudo nix-channel --update

echo
echo "Done."
echo
echo "Current channels:"
sudo nix-channel --list
echo
echo "Next step:"
echo "sudo nixos-rebuild switch"
