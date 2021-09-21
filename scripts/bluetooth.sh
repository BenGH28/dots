#!/usr/bin/env bash

# Dmenu script to connect to available bluetooth devices
# depends on bluetoothctl
# optionally improved by having the blueman-applet

# catch any errors
set -o errexit
set -o nounset
set -o pipefail

declare -a options=(
    "on"
    "off"
    "connect"
    "disconnect"
)

mac_addr=""

on() {
    bluetooth on
}

off() {
    bluetooth off
}

get_address() {
    device=$(bluetoothctl devices | dmenu -c -l 5 -bw 5 -p "select: ")
    mac_addr=$(echo $device | awk '{print $2}')
}

connect() {
    get_address
    bluetoothctl connect $mac_addr >/dev/null 2>&1
}

disconnect() {
    get_address
    bluetoothctl disconnect $mac_addr >/dev/null 2>&1
}

run() {
    choice=$(printf '%s\n' "${options[@]}" | dmenu -c -l -5 -bw 5 -p 'options:' "${@}")
    case $choice in
        "on") on ;;
        "off") off ;;
        "connect") connect ;;
        "disconnect") disconnect ;;
    esac
}

run
