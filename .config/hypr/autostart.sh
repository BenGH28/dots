#!/usr/bin/env bash

function run {
    if ! pgrep -f "$1"; then
        "$@" &
    fi
}

run waybar
run hyprpaper
run hypridle
run nm-applet
run blueman-applet
run pamac-tray
run accountable2you
run /usr/lib/polkit-kde-authentication-agent-1
run flameshot
