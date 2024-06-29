#  	 ______                 __  _
#   / ____/_  ______  _____/ /_(_)___  ____  _____
#  / /_  / / / / __ \/ ___/ __/ / __ \/ __ \/ ___/
# / __/ / /_/ / / / / /__/ /_/ / /_/ / / / (__  )
#/_/    \__,_/_/ /_/\___/\__/_/\____/_/ /_/____/
#
# extraction function copied from the bashrc
ex() {
    if [ -f $1 ]; then
        case $1 in
            *.tar.bz2) tar xjf $1 ;;
            *.tar.gz) tar xzf $1 ;;
            *.bz2) bunzip2 $1 ;;
            *.rar) unrar x $1 ;;
            *.gz) gunzip $1 ;;
            *.tar) tar xf $1 ;;
            *.tbz2) tar xjf $1 ;;
            *.tgz) tar xzf $1 ;;
            *.zip) unzip $1 ;;
            *.Z) uncompress $1 ;;
            *.7z) 7z x $1 ;;
            *) echo "'$1' cannot be extracted via ex()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}


### The Kitty Terminal ### doesn't work in TMUX :( withouth some extra work that I don't have the energy for
Atom() {
    kitty @set-colors -a "~/.config/kitty/onedark.conf" &&
        ln -sf ~/.config/kitty/onedark.conf ~/.config/kitty/theme.conf
}

AtomOneLight() {
    kitty @set-colors -a "~/.config/kitty/onelight.conf" &&
        ln -sf ~/.config/kitty/onelight.conf ~/.config/kitty/theme.conf
}

kitco() {
    case $TERM:$1 in
        xterm-kitty:dark) Atom ;;
        xterm-kitty:light) AtomOneLight ;;
        xterm-kitty:*) echo "this is not the theme you are looking for..." ;;
        *) echo "this is not kitty" ;;
    esac
}

# if tmux is executable and not inside a tmux session, then try to attach.
# if attachment fails, start a new session
go_tmux() {
    [ -x "$(command -v tmux)" ] &&
        [ -z "${TMUX}" ] &&
        { tmux attach || tmux new-session -s home; } >/dev/null 2>&1
}
