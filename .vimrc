"automatic installation of vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"Plugins using vim-plug
call plug#begin('~/.vim/plugged')

"themes
Plug 'itchyny/lightline.vim'
Plug 'dracula/vim'
"tools
Plug 'valloric/youcompleteme' "you need to run install.py to compile YCM core on first install
Plug 'lilydjwg/colorizer'
Plug 'honza/vim-snippets'
Plug 'sirver/ultisnips'
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdtree'
Plug 'python-mode/python-mode',{'for':'python', 'branch':'develop'}"
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'rhysd/vim-clang-format'
Plug 'tpope/vim-fugitive'
call plug#end()


"=========================================================================
"									Basics
"=========================================================================
let mapleader = " "
colorscheme dracula
set number relativenumber
syntax on
set ignorecase
set smartcase
set termguicolors "for accurate colors
set hidden "allows you to save buffers that you might still want to jump to
set wildmenu "statusline command completion
set backspace=indent,eol,start "allow backspacing over autoindent, line breaks and start of insert action
set shiftwidth=4
set tabstop=4
set autoindent "keeps indent from the line above
set nostartofline "stop certain movements from going to the first character of the line
set confirm "ask to save file before quit
set laststatus=2 
set noshowmode "gets rid of the redundant --insert--
let g:lightline = { 'colorscheme': 'darcula',}
set mouse=a "allow mouse use in all modes
set cmdheight=2 "command window height to 2 lines
set notimeout ttimeout ttimeoutlen=200 "timeout on keycodes not on mappings
filetype plugin on "detect filetype

"========================================================================
"									PLUGINS
"========================================================================
"syntastic config
set statusline+=%#Warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"UltiSnips Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<C-f>"
let g:UltiSnipsJumpForwardTrigger="<C-l>"
let g:UltiSnipsJumpBackwardTrigger="<C-h>"
let g:UltiSnipsEditSplit="vertical"

"Vim-clang-format config
let g:clang_format#code_style = "google"
let g:clang_format#auto_format = 1

"python-mode
let g:pymode_indent = 1
let g:pymode_doc = 1
let g:pymod_doc_bind = 'K' 
"========================================================================
"								User Mappings
"========================================================================
"copy and paste from clipboard
map <C-a> gg0vG$
vnoremap <C-c> "+y 
nnoremap <C-p> "+P 

"run make/binary
noremap <Leader>m :!make<CR>
noremap <Leader>c :!make clean<CR>
noremap <Leader>r :!./

"source vimrc
nnoremap <C-s> :source ~/.vimrc<CR>

"split windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
set splitbelow 
set splitright

"resizing splits
nnoremap <Leader>h :vertical resize -3<CR>
nnoremap <Leader>j :resize -3<CR>
nnoremap <Leader>k :resize +3<CR>
nnoremap <Leader>l :vertical resize +3<CR>
nnoremap <Leader>= <C-W>=
