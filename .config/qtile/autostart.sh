#!/bin/sh
picom &
if [ $HOSTNAME == 'Murtagh' ];then
    echo "randomizing" >> ~/test.sh
	nitrogen --random --set-scaled &
else
	nitrogen --restore &
fi
nm-applet &
xfce4-power-manager &
pamac-tray &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
betterlockscreen -u ~/Pictures/arcolinux/blue-earth-2880x1800.jpg &
