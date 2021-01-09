let $FZF_DEFAULT_COMMAND="rg --files --hidden --ignore-case --glob !.git/ --glob !.ccls-cache/"
let $FZF_DEFAULT_OPTS="--height 35% --layout=reverse --preview 'cat {}'"
let g:fzf_layout = {'down': '35%'}
