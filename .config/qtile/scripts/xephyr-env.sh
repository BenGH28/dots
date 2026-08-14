#!/usr/bin/bash
# Start Xephyr on :99
Xephyr -br -ac -noreset -screen 1280x720 :99 &

# Explicitly tell Qtile to use the X11 backend on :99
DISPLAY=:99 qtile start -b x11
