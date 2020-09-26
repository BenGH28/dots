"=============================================================
"							User Configs/Mappings
"=============================================================
"select all, copy and paste from clipboard
map <C-a> gg0vG$
vnoremap <C-c> "+y 
noremap <C-p> "+P 

"run make/binary
noremap <Leader>m :!make<CR>
noremap <Leader>c :!make clean<CR>
noremap <Leader>r :!./

"source vimrc
nnoremap <C-s> :source ~/.config/nvim/init.vim<CR>

"split windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"resizing splits
nnoremap <Leader>h :vertical resize -3<CR>
nnoremap <Leader>j :resize -3<CR>
nnoremap <Leader>k :resize +3<CR>
nnoremap <Leader>l :vertical resize +3<CR>
nnoremap <Leader>= <C-W>=

"go to end of line while in insert mode
inoremap <C-e> <C-o>A

"launch Doxygen quickly
noremap <Leader>do <C-o>:Dox<CR>

"Vim-Plug bindings
noremap <leader>pi :PlugInstall<CR>
noremap <leader>pu :PlugUpdate<CR>
noremap <leader>pc :PlugClean<CR>

"lets not use ESC
imap jk <ESC>
imap kj <ESC>

"fuzzyfinder
nnoremap <leader>gf :GFiles<CR>
nnoremap <leader>ff :Files<CR>

"Switch between bufferNext easier
nnoremap <leader><leader> :bNext<CR>

"Go to the settings
nmap <leader>fvd :e $MYVIMRC<CR>

"substitute word under cursor
nmap <leader>s :%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>
