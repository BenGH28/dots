#!/bin/bash
opts="Lock|Log out|Suspend|Reboot|Shutdown|Refresh"
char="|"
num=$(grep -o "$char" <<<"$opts" | wc -l)

len=$(expr $num + 1)
cmd=$(echo -e $opts | rofi -sep '|' -dmenu -i -l $len)
case $cmd in
Shutdown) shutdown now ;;
"Log out") qtile cmd-obj -o cmd -f shutdown ;;
Refresh) qtile cmd-obj -o cmd -f restart ;;
Reboot) reboot ;;
Lock) slock ;;
Suspend) systemctl suspend ;;
*) ;;
esac
