# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export EDITOR="vim"
# Path to your oh-my-zsh installation.
export ZSH="/home/ben/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
ZSH_THEME="agnoster"

# auto-correction.
ENABLE_CORRECTION="true"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Plugins
plugins=(vi-mode python pip web-search zsh_reload common-aliases themes)

source $ZSH/oh-my-zsh.sh

# User configuration
	 
stty -ixon #stops Ctrl-S from hanging the terminal
#	  ___    ___
#    /   |  / (_)___ _________  _____
#   / /| | / / / __ `/ ___/ _ \/ ___/
#  / ___ |/ / / /_/ (__  )  __(__  )
# /_/  |_/_/_/\__,_/____/\___/____/
#
alias gcm="git commit -m"
alias gpl="git pull" 
alias gps="git push"
alias ga="git add"
alias open="xdg-open"
alias vpn="sudo openconnect https://vpn.uleth.ca"
alias gstat="git status"
alias ..="cd .."
alias pipes="pipes.sh"
alias vimrc="vim $HOME/.vimrc"
alias S="sudo pacman -S"
alias Rs="sudo pacman -Rs" 
alias Ss="pacman -Ss"
alias Q="pacman -Q"
alias Syu="sudo pacman -Syu"
