#!/usr/bin/env sh
picom &
nitrogen --restore &
nm-applet &
xfce4-power-manager &
pamac-tray &
lshift &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
xset 500 &
xss-lock i3lock +resetsaver &
emacs --daemon &
