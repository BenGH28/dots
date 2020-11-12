#!/usr/bin/env sh
picom &
nitrogen --restore &
nm-applet &
xfce4-power-manager &
pamac-tray &
lshift &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
betterlockscreen -u ~/Pictures/Wallpapers/ -l blur --off 300 &
emacs --daemon &
