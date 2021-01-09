"formating if we can
nnoremap <Leader>fo :Format<CR>

"Go to the settings
"_files -> _vim -> _dotfiles = fvd
nnoremap <Leader>fv :e $MYVIMRC<CR>

"fuzzyfinder
"_files -> _directory
nnoremap <silent> <Leader>fd :Files<CR>
"search from $HOME
"_files -> _find
nnoremap <silent> <Leader>ff :Files ~<CR>
"_files -> _list
nnoremap <silent> <Leader>fl :Buffers<CR>

"Ranger
"_files -> _ranger
nnoremap <Leader>fr :RnvimrToggle<CR>"

"_files -> _write
nnoremap <Leader>fww :w<CR>
nnoremap <Leader>fwq :wq<CR>
nnoremap <Leader>fq :q<CR>

"source vimrc
nnoremap <Leader>v :source $MYVIMRC<CR>
