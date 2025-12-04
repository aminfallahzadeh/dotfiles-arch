#!/bin/bash

# Pick color
COLOR=$(hyprpicker -r)

# If no color selected, exit
[ -z "$COLOR" ] && exit 0

# Copy to clipboard
echo -n "$COLOR" | wl-copy

# Save the color to a temp file so Waybar can read it
echo -n "$COLOR" > /tmp/lastpickedcolor
