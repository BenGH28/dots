"=======================
"		Basics
"=======================
let mapleader = " "
colorscheme one
set background=light
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
set mouse=a "allow mouse use in all modes
set cmdheight=2 "command window height to 2 lines
set notimeout ttimeout ttimeoutlen=200 "timeout on keycodes not on mappings
set cursorline
set splitbelow 
set splitright
set nocompatible
filetype plugin on "detect filetype
set foldmethod=syntax
set foldnestmax=10
set nofoldenable
set nowrap
