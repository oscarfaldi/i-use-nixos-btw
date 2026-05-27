{ ... }:

{
  # Create Niri scripts directory and generate screenshot script automatically.
  system.activationScripts.niriScreenshotScript.text = ''
    mkdir -p /home/oscarfaldi/.config/niri/scripts

    cat > /home/oscarfaldi/.config/niri/scripts/screenshot.sh << 'EOF'
    #!/usr/bin/env bash

    DIR="$HOME/Pictures/Screenshots/$(date +%Y-%m)"

    mkdir -p "$DIR"

    FILE="$DIR/$(date +%Y-%m-%d_%H-%M-%S).png"

    grim -g "$(slurp)" "$FILE"
    EOF

  # Automatically make Niri scripts executable after rebuild.
    chmod +x /home/oscarfaldi/.config/niri/scripts/screenshot.sh
  '';
}
