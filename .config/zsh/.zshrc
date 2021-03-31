autoload -Uz compinit && compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' rehash true
setopt COMPLETE_ALIASES

SAVEHIST=1000
HISTFILE=$ZDOTDIR/zsh_history
_Z_DATA=$ZDOTDIR/.z

bindkey -v
#reverse history search with Ctrl-R
bindkey "^R" history-incremental-search-backward


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

[ -f "/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ] && \
    source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh || \
    echo "missing zsh-syntax-highlighting"

[ -f "/usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" ] && \
    source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh || \
    echo "missing zsh-autosuggestions"

source $ZDOTDIR/plugins/z.sh
source $ZDOTDIR/aliases.zsh
source $ZDOTDIR/functions.zsh

#haskell stuff
[ -f "/home/ben/.ghcup/env" ] && source "/home/ben/.ghcup/env"

eval "$(starship init zsh)"
