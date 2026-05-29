#!/usr/bin/env bash

MONTH_DIR="$(date '+%B %Y')"
BASE_DIR="$HOME/Pictures/Screenshots/$MONTH_DIR"

mkdir -p "$BASE_DIR"

FILE="$BASE_DIR/$(date '+%Y-%m-%d_%H-%M-%S').png"

grim -g "$(slurp)" "$FILE"

notify-send "Screenshot Saved" "$FILE"
