#!/usr/bin/env bash

# ==============================================================================
# Script: System Theme Configuration (Gruvbox Variant)
# Description: Sets the system color scheme to dark, applies the Gruvbox
#              GTK theme, Papirus-Dark icons, and forces Bibata Modern Ice cursor.
# ==============================================================================

set -euo pipefail

echo "Applying Gruvbox system theme configuration..."

# 1. Set Color Scheme to Prefer Dark (Forces dark mode web/app fallbacks like Chromium)
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'

# 2. Set GTK Theme to Gruvbox
gsettings set org.gnome.desktop.interface gtk-theme 'gruvbox-dark'

# 3. Set Icon Theme to Oomox Gruvbox Dark
gsettings set org.gnome.desktop.interface icon-theme 'oomox-gruvbox-dark'

# 4. Set Cursor Theme to Bibata-Modern-Ice
gsettings set org.gnome.desktop.interface cursor-theme 'Bibata-Modern-Ice'

echo "Gruvbox theme configuration applied successfully!"
