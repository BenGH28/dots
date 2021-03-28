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
alias dots="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
alias da="dots add"
alias dcm="dots commit -m"
alias dp="dots push"
alias dstat="dots status"
alias rn="ranger"
alias atd="alacritty-theme change one_dark"
alias atl="alacritty-theme change one_light"
alias mirrorUpdate="sudo pacman-mirrors --fasttrack && sudo pacman -Syyu"
alias lg="lazygit"
alias src="source $ZDOTDIR/.zshrc"

#some common aliases from oh-my-zsh
alias ls='exa --color=always'     #size,sow type,human readable
alias l='exa -lF --color=always'     #size,sow type,human readable
alias la='exa -laF --color=always'   #long list,show almost all,show type,human readable
alias lr='exa -tRF --color=always'   #sorted by date,recursive,show type,human readable
alias lt='exa -ltF --color=always'   #long list,sorted by date,show type,human readable
alias ll='exa -l --color=always'      #long list
alias ldot='exa -ld --color=always .*'
alias lS='exa -1FSs --color=always'
alias lart='exa -1Fcart --color=always'
alias lrt='exa -1Fcrt --color=always'

alias grep='grep --color'

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
