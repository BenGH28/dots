#!/usr/bin/env sh
picom --experimental-backends &
nitrogen --restore &
nm-applet &
blueman-applet &
xfce4-power-manager &
pamac-tray &
accountable2you &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
betterlockscreen -u ~/Pictures/arcolinux/soft-morning-3200x2000.jpg
dunst &
xmodmap ~/.Xmodmap &
