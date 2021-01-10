"auto install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
	silent !sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs
			\https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
endif
"sourcing some funcs and autocommands
source ~/.config/nvim/functions.vim
source ~/.config/nvim/autocommands.vim

"=============================================================
"							vim-plug
"=============================================================
call plug#begin('~/.vim/plugged')
"Pretty
Plug 'sainnhe/edge'
Plug 'mhinz/vim-startify'
"Languages and Syntax
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dense-analysis/ale'
Plug 'rust-lang/rust.vim'
Plug 'rhysd/vim-clang-format'
Plug 'suan/vim-instant-markdown'
Plug 'vim-scripts/DoxygenToolkit.vim'

"Tools
let g:vimspector_enable_mappings = 'VISUAL_STUDIO'
Plug 'puremourning/vimspector'
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'airblade/vim-rooter'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'lilydjwg/colorizer'
Plug 'unblevable/quick-scope'
Plug 'mhinz/vim-signify'
Plug 'voldikss/vim-floaterm'
Plug 'kevinhwang91/rnvimr', {'branch': 'main'}
Plug 'liuchengxu/vim-which-key'
Plug 'nvim-treesitter/nvim-treesitter', has('nvim-0.5') ? {'do':':TSUpdate'} : {'on': []}
"this needs to be called at the end to work correctly
Plug 'ryanoasis/vim-devicons'
call plug#end()

"=======================
"		Basics
"=======================
let mapleader = "\<Space>"
set encoding=utf-8
colorscheme edge
set nocompatible
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
set timeoutlen=500 
set cursorline
set splitbelow
set splitright
filetype plugin on "detect filetype
set foldmethod=syntax
set foldnestmax=10
set nofoldenable
set nowrap
set noswapfile  "no more pesky .swp file warnings"
set clipboard+=unnamedplus "the system clipboard is enabled"
set inccommand=split
let g:python3_host_prog = '/bin/python3'
"=============================================================
"							Plugin-Configs
"=============================================================
"Vim-clang-format
source $HOME/.config/nvim/plugins/vim-clang-format.vim

"Rust-lang
source $HOME/.config/nvim/plugins/rust.vim

"airline
source $HOME/.config/nvim/plugins/airline.vim

"Quick scope
source $HOME/.config/nvim/plugins/quickscope.vim

"DoxygenToolkit
source $HOME/.config/nvim/plugins/Doxygen.vim

"fzf 
source $HOME/.config/nvim/plugins/fzf.vim

"Ranger
source $HOME/.config/nvim/plugins/ranger.vim

"nerdtree
source $HOME/.config/nvim/plugins/nerdtree.vim

"Ale
source $HOME/.config/nvim/plugins/ale.vim

"CoC
source $HOME/.config/nvim/plugins/coc.vim

"Markdown
source $HOME/.config/nvim/plugins/markdown-preview.vim

"tree-sitter
if has("nvim-0.5")
	luafile $HOME/.config/nvim/plugins/treesitter.lua
endif

"rooter
source $HOME/.config/nvim/plugins/rooter.vim

"which-key
source $HOME/.config/nvim/plugins/whichkey.vim

"colorizer
source $HOME/.config/nvim/plugins/colorizer.vim

"signify
source $HOME/.config/nvim/plugins/signify.vim

"vimspector
source $HOME/.config/nvim/plugins/vimspector.vim
"=============================================================
"							User Configs/Mappings
"=============================================================
"run make
source $HOME/.config/nvim/mappings/map-make.vim

"Theme related stuff...kinda
source $HOME/.config/nvim/mappings/map-theme.vim

"split windows
source $HOME/.config/nvim/mappings/map-windows.vim

"Vim-Plug bindings
source $HOME/.config/nvim/mappings/map-plugged.vim

"lets not use ESC
source $HOME/.config/nvim/mappings/map-esc.vim

"files 
source $HOME/.config/nvim/mappings/map-files.vim

"git
source $HOME/.config/nvim/mappings/map-git.vim

"Switch between buffers easier
source $HOME/.config/nvim/mappings/map-buffers.vim

"Switch between Tabs easy-peasy
source $HOME/.config/nvim/mappings/map-tabs.vim

"miscellaneous mappings
source $HOME/.config/nvim/mappings/map-misc.vim

"CoC 
source $HOME/.config/nvim/mappings/map-coc.vim

"Floaterm
source $HOME/.config/nvim/mappings/map-floaterm.vim

"Easy align 
source $HOME/.config/nvim/mappings/map-easy-align.vim
