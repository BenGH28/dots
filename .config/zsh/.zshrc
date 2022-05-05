fpath+=~/.zfunc

autoload -Uz compinit && compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' rehash true
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

setopt completealiases
setopt autocd
setopt nocaseglob
setopt correct
setopt correctall
setopt nomatch

SAVEHIST=100000
HISTFILE=$ZDOTDIR/zsh_history
_Z_DATA=$ZDOTDIR/.z
EDITOR='nvim'

#gofor vi-mode
bindkey -v

#reverse history search with Ctrl-R
bindkey "^R" history-incremental-search-backward

#Ctrl-Backspace deletes the word behind the cursor
bindkey "^\b" backward-delete-word

#plugins
[ -f "/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ] &&
    source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ||
    echo "missing zsh-syntax-highlighting"

[ -f "/usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" ] &&
    source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ||
    echo "missing zsh-autosuggestions"

#haskell stuff
[ -f "/home/ben/.ghcup/env" ] && source "/home/ben/.ghcup/env"

for file in $ZDOTDIR/src/**/*(.); do
    source $file
done

# get tmux up and running
go_tmux

eval "$(starship init zsh)"
