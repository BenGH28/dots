#!/usr/bin/env bash

#Dmenu script to connect to available bluetooth devices

# catch any errors
set -o errexit
set -o nounset
set -o pipefail

device=$(bluetoothctl devices | dmenu -c -l 5 -bw 5)

mac_addr=$(echo $device | awk '{print $2}')

notification=$(bluetoothctl connect $mac_addr | grep "successful")

if [ -n "$notification" ]; then
    notify-send "bluetooth" "successful connection"
else
    notify-send "bluetooth" "failed connection"
fi
