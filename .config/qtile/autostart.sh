#!/usr/bin/env sh
picom --experimental-backends &
nitrogen --restore &
nm-applet &
xfce4-power-manager &
pamac-tray &
accountable2you &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
betterlockscreen -u ~/Pictures/arcolinux/blue-earth-2880x1800.jpg &
dunst &
xmodmap ~/.Xmodmap
