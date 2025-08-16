#!/usr/bin/env bash

CONFIG_DIR=$HOME/.config/
QTILE_DIR=$CONFIG_DIR/qtile/
SCRIPTS_DIR=$QTILE_DIR/scripts

#make a list of commands to run that can be selected with rofi
open_config() {
    kitty sh -c "cd $QTILE_DIR && nvim $QTILE_DIR"
}

look_and_feel() {
    bash "$SCRIPTS_DIR/themer.sh"
}

power() {
    bash "$SCRIPTS_DIR/power.sh"
}

packages() {
    bash "$SCRIPTS_DIR/packages.sh"
}

execute() {
    rofi -show combi -modes combi -combi-modes 'window,drun,'
}

emoji() {
    rofi -show emoji
}

declare -A commands
commands=(
    ["🔧 Config"]=open_config
    ["👓 Look & Feel"]=look_and_feel
    ["📦 Packages"]=packages
    ["⚡ Power"]=power
    ["🚀 Run"]=execute
    ["🤌 Emoji"]=emoji
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
