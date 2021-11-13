#!/usr/bin/env bash

tmux list-sessions |
    sed -E 's/:.*$//' |
    grep -v \"^$(tmux display-message -p '#S')\$\" |
    fzf --reverse --prompt="session:" |
    xargs tmux switch-client -t