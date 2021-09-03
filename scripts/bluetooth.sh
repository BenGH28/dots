#!/usr/bin/env bash

# Dmenu script to connect to available bluetooth devices
# depends on bluetoothctl
# optionally improved by having the blueman-applet

# catch any errors
set -o errexit
set -o nounset
set -o pipefail

declare -a options=(
    "connect"
    "disconnect"
)

choice=$(printf '%s\n' "${options[@]}" | dmenu -c -l -5 -bw 5 -p 'options:' "${@}")

device=$(bluetoothctl devices | dmenu -c -l 5 -bw 5 -p "select: ")

if [ "$choice" == "connect" ]; then
    mac_addr=$(echo $device | awk '{print $2}')
    bluetoothctl connect $mac_addr >/dev/null 2>&1
else
    mac_addr=$(echo $device | awk '{print $2}')
    bluetoothctl disconnect $mac_addr >/dev/null 2>&1
fi
