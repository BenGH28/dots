#!/usr/bin/bash

#to test the qtile config run this and then
Xephyr -br -ac -noreset -screen 1280x720 :1 &

DISPLAY=:1 exec qtile start
