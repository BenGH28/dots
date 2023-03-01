#!/bin/bash

cmd=$(echo -e "Lock|Log out|Suspend|Reboot|Shutdown" | rofi -sep '|' -dmenu -i -l 5) 

case $cmd in
    Shutdown) shutdown now ;;
    "Log out") qtile cmd-obj -o cmd -f shutdown ;;
    Reboot) reboot ;;
    Lock) slock ;;
    Suspend) systemctl suspend ;;
    *) ;;
esac
