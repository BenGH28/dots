autoload -Uz compinit && compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' rehash true

setopt completealiases
setopt autocd
setopt nocaseglob
setopt correct
setopt correctall

SAVEHIST=1000
HISTFILE=$ZDOTDIR/zsh_history
_Z_DATA=$ZDOTDIR/.z

bindkey -v
#reverse history search with Ctrl-R
bindkey "^R" history-incremental-search-backward

#plugins
[ -f "/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ] && \
    source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh || \
    echo "missing zsh-syntax-highlighting"

[ -f "/usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" ] && \
    source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh || \
    echo "missing zsh-autosuggestions"

#haskell stuff
[ -f "/home/ben/.ghcup/env" ] && source "/home/ben/.ghcup/env"

source $ZDOTDIR/plugins/z.sh
source $ZDOTDIR/aliases.zsh
source $ZDOTDIR/functions.zsh
source $ZDOTDIR/zle.zsh

eval "$(starship init zsh)"
