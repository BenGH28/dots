#!/usr/bin/env bash

list() {
	choice=$(tmux list-sessions |
		sed -E 's/:.*$//' |
		grep -v \"^$(tmux display-message -p '#S')\$\" |
		fzf --reverse --prompt="session:")

	# exit gracefully with no tmux complaint
	[ -z $choice ] && exit 0

	tmux switch-client -t $choice
}
list
