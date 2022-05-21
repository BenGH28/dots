#!/bin/bash

select_repo() {
	choice=$(/usr/bin/ls -A $HOME/repos | fzf --reverse --prompt="project: ")

	[ -z $choice ] && exit 0

	exists=$(tmux list-sessions | grep "$choice" | awk '{print $1}' | sed 's/://')

	case $exists in
	$choice) tmux switch-client -t $choice ;;
	*)
		tmux new-session -d -c $HOME/repos/$choice -s $choice
		tmux switch-client -t $choice
		;;
	esac
}

select_repo
