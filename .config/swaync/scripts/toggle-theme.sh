#!/usr/bin/env bash

THEME_FILE="$HOME/.config/theme/mode"

CURRENT=$(cat "$THEME_FILE" 2>/dev/null || echo "dark")

if [ "$CURRENT" = "dark" ]; then
  NEW="light"
else
  NEW="dark"
fi

echo "$NEW" > "$THEME_FILE"

# GTK
gsettings set org.gnome.desktop.interface color-scheme "prefer-$NEW"

# # Kitty
# kitty @ set-colors -a "$HOME/.config/kitty/themes/$NEW.conf"
kitten themes --reload-in=all $NEW

# Starship

STARSHIP_DIR="$HOME/.config/starship"

if [ "$NEW" = "dark" ]; then
  ln -sf "$STARSHIP_DIR/palettes/starship-dark.toml" \
         "$STARSHIP_DIR/starship.toml"
else
  ln -sf "$STARSHIP_DIR/palettes/starship-light.toml" \
         "$STARSHIP_DIR/starship.toml"
fi

# Waybar
WAYBAR_DIR="$HOME/.config/waybar"

if [ "$NEW" = "dark" ]; then
  ln -sf "$WAYBAR_DIR/themes/dark.css" "$WAYBAR_DIR/current-theme.css"
else
  ln -sf "$WAYBAR_DIR/themes/light.css" "$WAYBAR_DIR/current-theme.css"
fi

pkill waybar && hyprctl dispatch 'hl.dsp.exec_raw("waybar")'

# # SwayNC
SWAYNC_DIR="$HOME/.config/swaync"

if [ "$NEW" = "dark" ]; then
  ln -sf "$SWAYNC_DIR/themes/dark.css" "$SWAYNC_DIR/style.css"
else
  ln -sf "$SWAYNC_DIR/themes/light.css" "$SWAYNC_DIR/style.css"
fi

pkill swaync && yprctl dispatch 'hl.dsp.exec_raw("swaync")'

#
# # Hyprland
# hyprctl reload
#
# # Neovim (via signal)
# pkill -USR1 nvim 2>/dev/null
#
# # tmux
# tmux source-file "$HOME/.config/tmux/$NEW.conf" 2>/dev/null

notify-send "Theme switched" "$NEW mode"
