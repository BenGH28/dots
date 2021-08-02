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

cat() {
	THEME=$(alacritty-theme current | sed '/C/d' | awk '{print $2}')
	case $THEME in
		one_light) bat --theme OneHalfLight $@ ;;
		one_dark) bat --theme OneHalfDark $@ ;;
		*) bat $@ ;;
	esac
}

### The Kitty Terminal ###
Atom() {
	kitty @set-colors -a "~/.config/kitty/MyOneDark.conf" &&
		ln -sf ~/.config/kitty/MyOneDark.conf ~/.config/kitty/theme.conf
}

AtomOneLight() {
	kitty @set-colors -a "~/.config/kitty/MyOneLight.conf" &&
		ln -sf ~/.config/kitty/MyOneLight.conf ~/.config/kitty/theme.conf
}

kitco() {
	IN_KITTY=$(echo $TERM)
	case $IN_KITTY:$1 in
		xterm-kitty:dark) Atom ;;
		xterm-kitty:light) AtomOneLight ;;
		xterm-kitty:*) echo "this is not the theme you are looking for..." ;;
		*) echo "this is not kitty" ;;
	esac
}

# short for tmux attach -- technically will also start new tmux if necessary
go_tmux() {
	[ -x "$(command -v tmux)" ] &&
		[ -z "${TMUX}" ] &&
		{ tmux attach || tmux; } >/dev/null 2>&1
}
