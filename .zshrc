# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export EDITOR="nvim"
export VIMRC="$HOME/.config/nvim/init.vim"
export ZRC="$HOME/.zshrc"
export RANGER_LOAD_DEFAULT_RC=false
export IPYTHONDIR="~/.config/ipython"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
ZSH_THEME="simple"

# auto-correction.
ENABLE_CORRECTION="true"

# Plugins
# 
plugins=(
	z 
	themes
	vi-mode
	zsh_reload
	zsh-autosuggestions
	zsh-completions
	common-aliases
)
autoload -U compinit && compinit


source $ZSH/oh-my-zsh.sh

# User configuration
	 
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
alias ..="cd .."
alias pipes="pipes.sh"
alias vimrc="$EDITOR $VIMRC"
alias S="sudo pacman -S"
alias Rs="sudo pacman -Rs" 
alias Ss="pacman -Ss"
alias Q="pacman -Q"
alias Syu="sudo pacman -Syu"
alias pi="ssh pi@192.168.1.63"
alias zrc="$EDITOR $ZRC"
alias nv="$EDITOR"
alias vim="$EDITOR"
alias alconf="$EDITOR $HOME/.config/alacritty/alacritty.yml"
alias qconf="$EDITOR $HOME/.config/qtile/config.py"
alias dots="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
alias da="dots add"
alias dcm="dots commit -m"
alias dp="dots push"
alias dstat="dots status"  	 
alias rn="ranger"
alias atd="alacritty-theme change one_dark"
alias atl="alacritty-theme change one_light"
alias mirrorUp="sudo pacman-mirrors --fasttrack && sudo pacman -Syyu"

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
      *.rar)       unrar x $1   ;;
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

cat()
{
	THEME=$(alacritty-theme current | sed '/C/d' | awk '{print $2}')
	case $THEME in 
		one_light) bat --theme OneHalfLight $@;;
		one_dark)  bat --theme OneHalfDark $@;;
		*) 		   echo "I don't know what to do with '$THEME'";;
	esac
}

### The Kitty Terminal ###
Atom()
{
	kitty @set-colors -a "~/.config/kitty/kitty-themes/themes/Atom.conf" && \
		ln -sf ~/.config/kitty/kitty-themes/themes/Atom.conf ~/.config/kitty/theme.conf
}

AtomOneLight()
{
	kitty @set-colors -a "~/.config/kitty/kitty-themes/themes/AtomOneLight.conf" && \
		ln -sf ~/.config/kitty/kitty-themes/themes/AtomOneLight.conf ~/.config/kitty/theme.conf
}

kitco()
{
	IN_KITTY=$(echo $TERM)
	case $IN_KITTY:$1 in 
		xterm-kitty:dark) Atom ;;
		xterm-kitty:light) AtomOneLight ;;
		xterm-kitty:*) echo "this is not the theme you are looking for..." ;;
		*) echo "this is not kitty" ;;
	esac
}
