"auto install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
	silent !sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs
			\https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
endif

call MyFunctions#AlignAlacrittyBackground()
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
"sometimes nvim is finicky about treesitter resourcing init.vim seems to
"satisfy it
Plug 'nvim-treesitter/nvim-treesitter', has('nvim-0.5') ? {'do':':TSUpdate'} : {'on': []}
:lua << EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained",
  highlight = {
    enable = true,
  },
}
EOF
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
set autochdir
set scrolloff=8
set nolazyredraw      "don't show me the execution of macros"
let g:python3_host_prog = '/bin/python3'
"=============================================================
"		Vim Mappings Only
"=============================================================
inoremap jk <ESC>
inoremap kj <ESC>

nnoremap <Leader>ma :make<CR>
nnoremap <Leader>mc :make clean<CR>

"substitute word under cursor
nnoremap <Leader>sw :%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>

nnoremap <silent> <Leader>bn :bNext<CR>
nnoremap <silent> <Leader>bp :bprevious<CR>

nnoremap <silent> <Leader>. :tabn<CR>
nnoremap <silent> <Leader>, :tabp<CR>

"set background quickly if I'm not using alacritty
nnoremap <silent> <Leader>al :set background=light<CR>
nnoremap <silent> <Leader>ad :set background=dark<CR>

"alacritty themes
nnoremap <silent> <Leader>at :call MyFunctions#ToggleAlacrittyTheme()<CR>

nnoremap <silent> <C-h> :wincmd h<CR>
nnoremap <silent> <C-j> :wincmd j<CR>
nnoremap <silent> <C-k> :wincmd k<CR>
nnoremap <silent> <C-l> :wincmd l<CR>

"show only the current window
nmap <silent> <Leader>wo :on<CR>

"resizing splits
nnoremap <silent> <Leader>wh :vertical resize -3<CR>
nnoremap <silent> <Leader>wj :resize -3<CR>
nnoremap <silent> <Leader>wk :resize +3<CR>
nnoremap <silent> <Leader>wl :vertical resize +3<CR>
nnoremap <silent> <Leader>w= <C-W>=

"Go to the settings
"_files -> _vim -> _dotfiles = fvd
nnoremap <Leader>fv :e $MYVIMRC<CR>

"_files -> _write
nnoremap <Leader>fww :w<CR>
nnoremap <Leader>fwq :wq<CR>
nnoremap <Leader>fq :q<CR>

"source vimrc
nnoremap <Leader>v :source $MYVIMRC<CR>
