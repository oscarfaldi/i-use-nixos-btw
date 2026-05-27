{ ... }:

{
  # Create a reusable screenshot script for Niri.
  environment.etc."niri/scripts/screenshot.sh".text = ''
    #!/usr/bin/env bash

    DIR="$HOME/Pictures/Screenshots/$(date +%Y-%m)"

    mkdir -p "$DIR"

    FILE="$DIR/$(date +%Y-%m-%d_%H-%M-%S).png"

    grim -g "$(slurp)" "$FILE"
  '';

  # Make all Niri scripts executable automatically during rebuild.
  system.activationScripts.makeNiriScriptsExecutable.text = ''
    chmod +x /home/oscarfaldi/.config/niri/scripts/*.sh
  '';
}
