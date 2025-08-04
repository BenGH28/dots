fpath+=~/.zfunc

autoload -Uz compinit && compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' rehash true
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

setopt completealiases
setopt autocd
setopt autopushd
setopt nocaseglob
unsetopt correctall
setopt nomatch
setopt sharehistory

export SAVEHIST=100000
export HISTFILE=$ZDOTDIR/zsh_history
export _Z_DATA=$ZDOTDIR/.z
export EDITOR='nvim'
export VISUAL='nvim'
export FZF_DEFAULT_OPTS="--ansi --style full"


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
# clever_tmux


if [[ $(tty) != *"tty"* ]]; then
    eval "$(starship init zsh)"
fi
eval "$(glow completion zsh)"

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(zoxide init zsh)"
eval "$(fzf --zsh)"
