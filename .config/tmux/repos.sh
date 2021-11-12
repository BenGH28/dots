#!/bin/bash

choice=$(/usr/bin/ls -A $HOME/repos | fzf --reverse --prompt="project: ")

exists=$(tmux list-sessions | grep "$choice" | awk '{print $1}' | sed 's/://')

if [ $exists == $choice ]; then
    tmux switch-client -t $choice
else
    tmux new-session -d -c $HOME/repos/$choice -s $choice
    tmux switch-client -t $choice
fi
