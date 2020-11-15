#!/usr/bin/env sh

cmd=$(echo -e "Shutdown\nLog Out\nReboot" | dmenu -c -l 3 -bw 5) 

case $cmd in
	Shutdown) shutdown now;;
	"Log Out") qtile-cmd -o cmd -f shutdown;;
	Reboot) reboot;;
	*);;
esac
