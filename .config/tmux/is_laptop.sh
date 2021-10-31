#!/usr/bin/env bash

#if has a battery
[ -f /sys/class/power_supply/BAT?/model_name ] && true || false
