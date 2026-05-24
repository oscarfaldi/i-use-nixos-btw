#!/usr/bin/env bash

set -euo pipefail

REPO="https://github.com/oscarfaldi/install-nixos.git"
TMP_DIR="$HOME/install-nixos"

echo "==> Installing git..."
sudo nix-env -iA nixos.git

echo "==> Cleaning temp directory..."
rm -rf "$TMP_DIR"

echo "==> Cloning repository..."
git clone "$REPO" "$TMP_DIR"

echo "==> Replacing NixOS configuration..."

# Preserve hardware config only
sudo find /etc/nixos \
    -mindepth 1 \
    ! -name 'hardware-configuration.nix' \
    -exec rm -rf {} +

echo "==> Copying new configuration..."
sudo cp -r "$TMP_DIR"/* /etc/nixos/

echo "==> Rebuilding system..."
sudo nixos-rebuild switch

echo "==> Done Fal."
