#!/usr/bin/env bash

CONFIG_DIR=$HOME/.config/
QTILE_DIR=$CONFIG_DIR/qtile/
SCRIPTS_DIR=$QTILE_DIR/scripts

source "$SCRIPTS_DIR/utils.sh"

#make a list of commands to run that can be selected with rofi
open_config() {
    selection=$(fd -H --exclude "*.png" --exclude ".git" --exclude "__pycache__" --exclude "mypy*" --type f . "$CONFIG_DIR" | rofi -dmenu -sorting-method 'fzf')
    if [ -n "$selection" ]; then
        kitty sh -c "nvim $selection"
    fi
}

style() {
    bash "$SCRIPTS_DIR/themer.sh"
}

power() {
    bash "$SCRIPTS_DIR/power.sh"
}

packages() {
    bash "$SCRIPTS_DIR/packages.sh"
}

launch() {
    bash "$SCRIPTS_DIR/rofi-drun.sh"
}

emoji() {
    rofi -show emoji
}

windows() {
    rofi -show window
}

declare -A commands
commands=(
    ["  Config"]=open_config
    ["  Style"]=style
    ["  Packages"]=packages
    ["󱐋  Power"]=power
    ["󱓞  Launch"]=launch
    ["  Emoji"]=emoji
    ["  windows"]=windows
)

# Build a sorted list by value (second column)
sorted_keys=$(for key in "${!commands[@]}"; do
    echo -e "$key\t${commands[$key]}"
done | sort -k2,2 | cut -f1)
len=${#commands[@]}

selected_command=$(printf "%s\n" "${sorted_keys[@]}" | rofi -theme-str 'window {width: 400px;}' -case-smart -dmenu -p "Menu" -l "$len")
if [ -n "$selected_command" ]; then
    ${commands[$selected_command]}
fi
