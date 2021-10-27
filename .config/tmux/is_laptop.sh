#!/usr/bin/env bash

#if has a battery
[ -f /sys/class/power_supply/BAT?/model_name ] && exit 0 || exit 1
