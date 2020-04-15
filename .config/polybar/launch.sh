#!/usr/bin/sh

#terminate all instances of polybar
killall -q polybar

polybar -c $HOME/.config/polybar/config bar1 &
