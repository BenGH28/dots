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
alias zrc="$EDITOR $ZDOTDIR/.zshrc"
alias vim="$EDITOR"
alias alconf="$EDITOR $HOME/.config/alacritty/alacritty.yml"
alias qconf="$EDITOR $HOME/.config/qtile/config.py"
alias rn="ranger"
alias atd="alacritty-theme change one_dark"
alias atl="alacritty-theme change one_light"
alias mirrorUpdate="sudo pacman-mirrors --fasttrack && sudo pacman -Syyu"
alias lg="lazygit"
alias src="source $ZDOTDIR/.zshrc"

#some common aliases from oh-my-zsh
alias ls='exa --color=always --group-directories-first'     #size,sow type,human readable
alias l='exa -lF --color=always --group-directories-first'     #size,sow type,human readable
alias la='exa -laF --color=always --group-directories-first'   #long list,show almost all,show type,human readable
alias ll='exa -l --color=always --group-directories-first'      #long list

alias grep='grep --color'

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
