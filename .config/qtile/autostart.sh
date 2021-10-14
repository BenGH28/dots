#!/usr/bin/env sh
picom --experimental-backends &
nitrogen --restore &
nm-applet &
blueman-applet &
xfce4-power-manager &
pamac-tray &
accountable2you &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
dunst &
xmodmap ~/.Xmodmap &

#if not a laptop set my displays accordingly
[ ! -f /sys/class/power_supply/BAT0/model_name ] &&
    xrandr --output DP-2 --mode 1920x1080 --rate 60 --primary &&
    xrandr --output HDMI-0 --mode 1920x1080 --rate 60 --noprimary --right-of DP-2
