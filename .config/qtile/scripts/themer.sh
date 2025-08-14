#!/usr/bin/env bash
CONSTS="$HOME/.config/qtile/constants.py"
COLOURS="$HOME/.config/qtile/colours.py"

themes=$(grep -e '^[A-Z].* ' "$COLOURS" | awk '{print $1}' | tr '[:upper:]' '[:lower:]' | tr '[=_=]' ' ' | sort -u)

current_theme=$(grep -e "^PALETTE = .*" "$CONSTS" | awk '{print $3}' | tr '[:upper:]' '[:lower:]' | tr '[=_=]' ' ')
selected_theme=$(echo "$themes" | rofi -dmenu -p "Theme ($current_theme)")
if [ -n "$selected_theme" ]; then
    selected_theme="$(echo "$selected_theme" | tr '[:lower:]' '[:upper:]' | tr '[= =]' '_')"
    sed -i "s/^PALETTE = .*/PALETTE = $selected_theme/" "$CONSTS"
    qtile cmd-obj -o cmd -f restart
    exit 0
fi
