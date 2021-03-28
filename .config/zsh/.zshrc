autoload -Uz compinit && compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' rehash true
setopt COMPLETE_ALIASES

[ -f "/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ] && \
    source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh || \
    echo "missing zsh-syntax-highlighting"

[ -f "/usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" ] && \
    source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh || \
    echo "missing zsh-autosuggestions"

source $HOME/.config/zsh/aliases.zsh
source $HOME/.config/zsh/functions.zsh

#haskell stuff
[ -f "/home/ben/.ghcup/env" ] && source "/home/ben/.ghcup/env"

eval "$(starship init zsh)"
