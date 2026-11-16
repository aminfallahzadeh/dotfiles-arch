#!/usr/bin/env bash

# PUT THIS FILE IN ~/.local/bin

THEME_FILE="$HOME/.config/theme/mode"

CURRENT=$(cat "$THEME_FILE" 2>/dev/null || echo "dark")

if [ "$CURRENT" = "dark" ]; then
    NEW="light"
    THEME_NAME="Graphite-Light"
else
    NEW="dark"
    THEME_NAME="Graphite-Dark"
fi

echo "$NEW" > "$THEME_FILE"

# GTK settings
gsettings set org.gnome.desktop.interface color-scheme "prefer-$NEW"
gsettings set org.gnome.desktop.interface gtk-theme "$THEME_NAME"

# Update GTK3 and GTK4 settings.ini
for version in 3.0 4.0; do
    CONFIG="$HOME/.config/gtk-$version/settings.ini"

    if [ -f "$CONFIG" ]; then
        if grep -q '^gtk-theme-name=' "$CONFIG"; then
            sed -i "s/^gtk-theme-name=.*/gtk-theme-name=$THEME_NAME/" "$CONFIG"
            sed -i "s/^gtk-application-prefer-dark-theme=.*/gtk-application-prefer-dark-theme=$( [ "$NEW" = "dark" ] && echo 1 || echo 0 )/" "$CONFIG"
        else
            sed -i "/^\[Settings\]/a gtk-theme-name=$THEME_NAME" "$CONFIG"
            sed -i "/^\[Settings\]/a gtk-application-prefer-dark-theme=$( [ "$NEW" = "dark" ] && echo 1 || echo 0 )" "$CONFIG"
        fi
    fi
done

# Update GTK4 theme symlinks
GTK4_CONFIG="$HOME/.config/gtk-4.0"

ln -sfn "$HOME/.themes/$THEME_NAME/gtk-4.0/gtk.css" \
    "$GTK4_CONFIG/gtk.css"

ln -sfn "$HOME/.themes/$THEME_NAME/gtk-4.0/gtk-dark.css" \
    "$GTK4_CONFIG/gtk-dark.css"

# Update xsettingsd.conf
XSETTINGS="$HOME/.config/xsettingsd/xsettingsd.conf"

if [ -f "$XSETTINGS" ]; then
    sed -i "s|^Net/ThemeName .*|Net/ThemeName \"$THEME_NAME\"|" "$XSETTINGS"

    pkill -x xsettingsd
    xsettingsd &
fi

# Update GTK2 custom settings
GTK2_CONFIG="$HOME/.gtkrc-2.0.mine"

if [ -f "$GTK2_CONFIG" ]; then
    sed -i "s|^gtk-theme-name=.*|gtk-theme-name=\"$THEME_NAME\"|" "$GTK2_CONFIG"
fi

# Restart Nautilus to apply theme
if pgrep -x nautilus >/dev/null; then
    nautilus -q
    gtk-launch org.gnome.Nautilus &
fi

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
