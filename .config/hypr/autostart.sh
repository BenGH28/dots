#!/usr/bin/env bash

function run {
    if ! pgrep -f "$1"; then
        "$@" &
    fi
}

run waybar -l debug >~/.config/hypr/waybar_debug.log
run hyprpaper
run hypridle
run blueman-applet
run accountable2you
run /usr/lib/polkit-kde-authentication-agent-1
