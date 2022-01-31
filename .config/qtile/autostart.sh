#!/usr/bin/env sh

count=0
main() {
	picom --experimental-backends &
	count=$(count + $?)

	nitrogen --restore &
	count=$((count + $?))

	nm-applet &
	count=$((count + $?))

	blueman-applet &
	count=$((count + $?))

	xfce4-power-manager &
	count=$((count + $?))

	pamac-tray &
	count=$((count + $?))

	accountable2you &
	count=$((count + $?))

	/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
	count=$((count + $?))

	dunst &
	count=$((count + $?))

	xmodmap ~/.Xmodmap &
	count=$((count + $?))

	return $count
}

main
