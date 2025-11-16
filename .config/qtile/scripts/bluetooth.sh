#!/usr/bin/env bash

# Dmenu script to connect to available bluetooth devices
# depends on bluetoothctl
# optionally improved by having the blueman-applet

# catch any errors
set -o errexit
set -o nounset
set -o pipefail

mac_addr=""

on() {
    bluetoothctl power on
}

off() {
    bluetoothctl power off
}

get_address() {
    device=$(bluetoothctl devices | grep Device | rofi -dmenu -l 4 -p "select")
    mac_addr=$(echo "$device" | awk '{print $2}')
}

connect() {
    get_address
    bluetoothctl connect "$mac_addr" >/dev/null 2>&1
}

disconnect() {
    get_address
    bluetoothctl disconnect "$mac_addr" >/dev/null 2>&1
}

declare -A options
options=(
    ["󰂯 on"]=on
    [" off"]=off
    ["󰂱 connect"]=connect
    ["  disconnect"]=disconnect
)

sorted_keys=$(for key in "${!options[@]}"; do
    echo -e "$key\t${options[$key]}"
done | sort -k2,2 | cut -f1)

choice=$(printf '%s\n' "${sorted_keys[@]}" | rofi -dmenu -l 4 -p 'options' "${@}")
if [ -n "$choice" ]; then
    ${options[$choice]}
fi
