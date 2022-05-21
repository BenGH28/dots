#!/usr/bin/env bash

project_dir=$HOME/repos

project_name=""
repo_path=""

get_project_name() {
	read -p "Enter new project name: " project_name
}

make_project_repo() {
	repo_path="$project_dir/$project_name"
	mkdir $repo_path
}

create_new_session() {
	tmux new-session -d -c $repo_path -s $project_name
}

switch_to_session() {
	tmux switch-client -t $project_name
}

new() {
	get_project_name
	make_project_repo
	create_new_session
	switch_to_session
}

new
