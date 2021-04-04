#!/bin/zsh

#### Thanks Luke Smith
# Change cursor shape for different vi modes.
zle-keymap-select () {
    case $KEYMAP in
        vicmd) echo -ne '\e[1 q';;      # block
        viins|main) echo -ne '\e[5 q';; # beam
    esac
}
zle -N zle-keymap-select

zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap
    echo -ne '\e[5 q'
}
zle -N zle-line-init
####

git_or_yadm(){
    [ -d .git ] && git $@ || yadm $@
}
status(){
    zle kill-whole-line
    git_or_yadm status
    zle accept-line
}
zle -N status
bindkey '^g' status

addu(){
    zle kill-whole-line
    git_or_yadm add -u
    zle accept-line
}
zle -N addu
bindkey '^a' addu

commit(){
    zle kill-whole-line
    git_or_yadm commit
    zle accept-line
}
zle -N commit
bindkey '^m' commit
