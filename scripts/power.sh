#!/bin/bash

cmd=$(echo -e "Lock\nLog out\nSuspend\nReboot\nShutdown" | dmenu -c -l 5 -bw 5)

case    $cmd in
    Shutdown) shutdown now ;;
    "Log out") qtile-cmd -o cmd -f shutdown ;;
    Reboot) reboot ;;
    Lock) betterlockscreen -l blur ;;
    Suspend) systemctl suspend ;;
*) ;;
esac
