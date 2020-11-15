#!/usr/bin/env sh

cmd=$(echo -e "Lock\nShutdown\nLog out\nReboot" | dmenu -c -l 4 -bw 5) 

case $cmd in
	Shutdown) shutdown now;;
	"Log out") qtile-cmd -o cmd -f shutdown;;
	Reboot) reboot;;
	Lock) betterlockscreen -l blur;;
	*);;
esac
