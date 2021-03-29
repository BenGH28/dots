autoload -Uz compinit && compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' rehash true
setopt COMPLETE_ALIASES

SAVEHIST=1000
HISTFILE=$ZDOTDIR/zsh_history
_Z_Data=$ZDOTDIR/z

set -o vi
#reverse history search with Ctrl-R
bindkey "^R" history-incremental-search-backward

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
