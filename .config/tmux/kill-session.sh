#!/usr/bin/env bash

choice=$(tmux list-sessions |
	sed -E 's/:.*$//' |
	grep -v \"^$(tmux display-message -p '#S')\$\" |
	fzf --reverse --prompt="kill:")

# we can Ctrl-C the window and not get a fleeting error from tmux
[ -z $choice ] && exit 0

tmux kill-session -t $choice
