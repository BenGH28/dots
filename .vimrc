"Plugins using vim-plug
call plug#begin('~/.vim/plugged')

"the list of plugins
"themes
Plug 'pgavlin/pulumi.vim'
Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
Plug 'stillwwater/vim-nebula'
Plug 'itchyny/lightline.vim'
"tools
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdcommenter'
Plug 'rhysd/vim-clang-format'
call plug#end()

"for accurate colors
if has ('termguicolors')
	set termguicolors
endif

"make it look good
colorscheme nebula

"relative numbering on the side bar
set number relativenumber

"need that syntax
syntax on

"ward off against changes made by the distro
set nocompatible

"keeps undo history for multiple files and keeps you safe against
"crashes...I think
set hidden 

"Better command-line completion
set wildmenu

"use case insensitive search, except when using captials
set ignorecase
set smartcase

"allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

"keeps indent from the line above
set autoindent

"stop certain movements from going to the first character of the line
set nostartofline

"ask to save file before quit
set confirm

"display status line
set laststatus=2
set noshowmode "gets rid of the redundant --insert--
let g:lightline = { 'colorscheme': 'wombat',}

"allow mouse use in all modes
set mouse=a

"command window height to 2 lines
set cmdheight=2

"timeout on keycodes not on mappings
set notimeout ttimeout ttimeoutlen=200

"use <F12> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F12>

"indentation options and tabs
set shiftwidth=4
set tabstop=4

"detect filetype
filetype plugin on

"syntastic config
set statusline+=%#Warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

