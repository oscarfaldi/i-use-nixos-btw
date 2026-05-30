#!/usr/bin/env bash

set -e

echo "Updating hardware config..."

cp /etc/nixos/hardware-configuration.nix \
   ./hardware-configuration.nix

git add hardware-configuration.nix

echo "Running dry-build..."

sudo nixos-rebuild dry-build --flake .#arizona

echo "Dry-build successful."

echo "Applying configuration..."

sudo nixos-rebuild switch --flake .#arizona
