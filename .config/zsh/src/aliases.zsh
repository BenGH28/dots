#	  ___    ___
#    /   |  / (_)___ _________  _____
#   / /| | / / / __ `/ ___/ _ \/ ___/
#  / ___ |/ / / /_/ (__  )  __(__  )
# /_/  |_/_/_/\__,_/____/\___/____/
#

alias ga="git add"
alias gcm="git commit -m"
alias gco="git checkout"
alias gpl="git pull"
alias gps="git push"
alias gstat="git status"

alias open="xdg-open"

alias Q="pacman -Q"
alias Rs="sudo pacman -Rs"
alias S="sudo pacman -S"
alias Ss="pacman -Ss"
alias Syu="sudo pacman -Syu"

alias pi="ssh pi@192.168.1.63"

# common configs
alias alconf="$EDITOR $HOME/.config/alacritty/alacritty.yml"
alias qconf="$EDITOR $HOME/.config/qtile/config.py"
alias vimrc="$EDITOR $VIMRC"
alias zrc="$EDITOR $ZDOTDIR/.zshrc"

alias vim="$EDITOR"
alias rn="ranger"

alias atd="alacritty-theme change one_dark"
alias atl="alacritty-theme change one_light"

alias mirrorUpdate="sudo pacman-mirrors --fasttrack && sudo pacman -Syyu"
alias lg="lazygit"

alias src="source $ZDOTDIR/.zshrc"

# yadm
alias yadd="yadm add"
alias yaddu="yadm add -u"
alias ycm="yadm commit -m"
alias yps="yadm push"
alias ypl="yadm pull"
alias ystat="yadm status"

alias tm="go_tmux"
alias cht="cht.sh"

# exa
alias ls='exa --color=always --group-directories-first --icons'      #size,show type,
alias l='exa -lF --color=always --group-directories-first --icons'   #size,show type,
alias la='exa -laF --color=always --group-directories-first --icons' #long list,show almost all,show type,
alias ll='exa -l --color=always --group-directories-first --icons'   #long list
alias lT='exa -lT --color=always --group-directories-first --icons'  #long list, recurse into dirs

alias grep='grep --color'

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

alias activate='source ./.venv/bin/activate'
#
# make venvs easier
alias mkvenv='python3 -m venv .venv && source ./.venv/bin/activate && pip install --upgrade pip'
