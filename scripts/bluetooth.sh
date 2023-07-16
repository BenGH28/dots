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
	bluetoothctl power on
}

off() {
	bluetoothctl power off
}

get_address() {
	device=$(bluetoothctl devices | rofi -dmenu -l 4 -p "select: ")
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
	choice=$(printf '%s\n' "${options[@]}" | rofi -dmenu -l 4 -p 'options:' "${@}")
	case $choice in
	"on") on ;;
	"off") off ;;
	"connect") connect ;;
	"disconnect") disconnect ;;
	esac
}

run
