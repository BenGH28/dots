#!/usr/bin/env bash

tmux list-sessions |
    sed -E 's/:.*$//' |
    grep -v \"^$(tmux display-message -p '#S')\$\" |
    fzf --reverse --prompt="kill:" |
    xargs tmux kill-session -t
