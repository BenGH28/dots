#!/bin/zsh

#### Thanks Luke Smith

# Change cursor shape for different vi modes.
zle-keymap-select() {
    case $KEYMAP in
        vicmd) echo -ne '\e[1 q' ;;        # block
        viins | main) echo -ne '\e[5 q' ;; # beam
    esac
}
zle -N zle-keymap-select

zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap
    echo -ne '\e[5 q'
}
zle -N zle-line-init
####

git_or_yadm() {
    [ -d .git ] && git $@ || yadm $@
}
# \e = Alt
status() {
    zle kill-whole-line
    git_or_yadm status
    zle accept-line
}
zle -N status
bindkey '\eg' status # Alt+g

addu() {
    zle kill-whole-line
    # add the normal stuff
    git_or_yadm add -u
    zle accept-line
    # let me see that I added everything
    git_or_yadm status
}
zle -N addu
bindkey '\ea' addu # Alt+a

commit() {
    zle kill-whole-line
    git_or_yadm commit
    zle accept-line
}
zle -N commit
bindkey '\em' commit # Alt+m

pull() {
    zle kill-whole-line
    git_or_yadm pull
    zle accept-line
}
zle -N pull
bindkey '\epl' pull # Alt+p l

push() {
    zle kill-whole-line
    git_or_yadm push
    zle accept-line
}
zle -N push
bindkey '\eps' push # Alt+p s


fzf_open_in_nvim() {
    local selected_file
    selected_file=$(fd -H  --exclude "*.png" --exclude ".git" --type f . | fzf -m --preview='bat --color=always {}')
    if [[ -n "$selected_file" ]]; then
        # take a multiline string turn it into an array
        selected_file=("${(@f)selected_file}")
        vim $selected_file
    fi
    zle accept-line
}
zle -N fzf_open_in_nvim
bindkey '^O' fzf_open_in_nvim
