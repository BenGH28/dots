let $FZF_DEFAULT_COMMAND="rg --files --hidden --ignore-case --glob !.git/ --glob !.ccls-cache/"
let $FZF_DEFAULT_OPTS="--height 35% --layout=reverse --preview 'cat {}'"
let g:fzf_layout = {'down': '35%'}

"_files -> _directory
nnoremap <silent> <Leader>fd :Files<CR>
"search from $HOME
"_files -> _find
nnoremap <silent> <Leader>ff :Files ~<CR>
"_files -> _list
nnoremap <silent> <Leader>fl :Buffers<CR>
