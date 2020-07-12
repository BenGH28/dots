# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export EDITOR="nvim"
export VIMRC="$HOME/.config/nvim/init.vim"
export ZRC="$HOME/.zshrc"

#custom web search 
ZSH_WEB_SEARCH_ENGINES=(
	archwiki "https://wiki.archlinux.org/index.php?title=Special%3ASearch&search="
	)
# Path to your oh-my-zsh installation.
export ZSH="/home/ben/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
ZSH_THEME="agnoster"

# auto-correction.
ENABLE_CORRECTION="true"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Plugins
plugins=(web-search vi-mode zsh_reload common-aliases themes)

source $ZSH/oh-my-zsh.sh

# User configuration
	 
# stty -ixon
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
alias gstat="git status"
alias gco="git checkout"
alias open="xdg-open"
alias vpn="sudo openconnect https://vpn.uleth.ca"
alias ..="cd .."
alias pipes="pipes.sh"
alias vimrc="nvim $HOME/.config/nvim/init.vim"
alias S="sudo pacman -S"
alias Rs="sudo pacman -Rs" 
alias Ss="pacman -Ss"
alias Q="pacman -Q"
alias Syu="sudo pacman -Syu"
alias pi="ssh pi@192.168.1.63"
alias zrc="nvim $HOME/.zshrc"
alias nv="nvim"
alias vim="nvim"
alias alconf="nvim $HOME/.config/alacritty/alacritty.yml"
alias dots="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

  	 
#  	 ______                 __  _
#   / ____/_  ______  _____/ /_(_)___  ____  _____
#  / /_  / / / / __ \/ ___/ __/ / __ \/ __ \/ ___/
# / __/ / /_/ / / / / /__/ /_/ / /_/ / / / (__  )
#/_/    \__,_/_/ /_/\___/\__/_/\____/_/ /_/____/
#
# extraction function copied from the bashrc
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

