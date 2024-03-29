#!/usr/bin/env sh

function run {
  if ! pgrep -f $1 ;
  then
    $@&
  fi
}

run picom --experimental-backends
run nitrogen --restore
run nm-applet
run blueman-applet
run xfce4-power-manager
run pamac-tray
run accountable2you
run /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1
run dunst
run xmodmap ~/.Xmodmap
