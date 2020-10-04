"=============================================================
"							vim-plug
"=============================================================
call plug#begin('~/.vim/plugged')
"Pretty
Plug 'rakr/vim-one'
Plug 'sainnhe/edge'
Plug 'mhinz/vim-startify'

"tools
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dense-analysis/ale'
Plug 'vim-airline/vim-airline'
Plug 'lilydjwg/colorizer'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'rhysd/vim-clang-format'
Plug 'rust-lang/rust.vim'
Plug 'unblevable/quick-scope'
Plug 'vim-scripts/DoxygenToolkit.vim'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mhinz/vim-signify'
Plug 'vimwiki/vimwiki'
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
Plug 'ryanoasis/vim-devicons'
call plug#end()


"=======================
"		Basics
"=======================
let mapleader = " "
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
set notimeout ttimeout ttimeoutlen=100 "timeout on keycodes not on mappings
set cursorline
set splitbelow
set splitright
filetype plugin on "detect filetype
set foldmethod=syntax
set foldnestmax=10
set nofoldenable
set nowrap
set clipboard+=unnamedplus "the system clipboard is enabled"
set noswapfile  "no more pesky .swp file warnings"
set inccommand=split


"=============================================================
"							Plugin-Configs
"=============================================================
"Vim-clang-format config
let g:clang_format#code_style = "google"
let g:clang_format#auto_format = 1

"Rust-lang config
let g:rustfmt_autosave = 1

"airline config
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#whitespace#checks = []

"Easy align config
"easy align in visual mode (ex. vipga select inner paragraph easy align)
xmap ga <Plug>(EasyAlign)
"interactive mode for a motion/text object (ex.gaip = ga (easy align) inner
"paragraph)
nmap ga <Plug>(EasyAlign)

"Quick scope config
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
highlight QuickScopePrimary guifg='#0007DF' gui=underline ctermfg=155 cterm=underline
highlight QuickScopeSecondary guifg='#008800' gui=underline ctermfg=81 cterm=underline
let g:qs_max_chars=150

"DoxygenToolkit config
let g:DoxygenToolkit_briefTag_pre="@Synopsis  "
let g:DoxygenToolkit_paramTag_pre="@Param "
let g:DoxygenToolkit_returnTag="@Returns   "
let g:DoxygenToolkit_authorName="Ben Hunt"

"Markdown
let g:instant_markdown_autostart = 1
let g:instant_markdown_allow_external_content = 0
let g:instant_markdown_logfile = '/tmp/instant_markdown.log'
let g:instant_markdown_browser = "firefox --new-window"
let g:instant_markdown_autoscroll = 0

"fzf 
let $FZF_DEFAULT_COMMAND="rg --files --hidden --ignore-case"
let g:fzf_colors =
	\ { 'fg':      ['fg', 'Normal'],
	\ 'bg':      ['bg', 'Normal'],
	\ 'hl':      ['fg', 'Comment'],
	\ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
	\ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
	\ 'hl+':     ['fg', 'Statement'],
	\ 'info':    ['fg', 'PreProc'],
	\ 'border':  ['fg', 'Ignore'],
	\ 'prompt':  ['fg', 'Conditional'],
	\ 'pointer': ['fg', 'Exception'],
	\ 'marker':  ['fg', 'Keyword'],
	\ 'spinner': ['fg', 'Label'],
	\ 'header':  ['fg', 'Comment'] }

"Conquer of Completion is too big for this file
source ~/.config/nvim/coc.vim

"=============================================================
"							User Configs/Mappings
"=============================================================
"select all
map <C-a> gg0vG$

"run make/binary
nnoremap <Leader>m :!make<CR>
nnoremap <Leader>c :!make clean<CR>
nnoremap <Leader>r :!./

"set background quickly if I'm not using alacritty
nnoremap <leader>bl :set background=light<CR>
nnoremap <leader>bd :set background=dark<CR>


"source vimrc
nnoremap <leader>so :source $MYVIMRC<CR>

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
noremap <leader>pi :so $MYVIMRC<CR> :PlugInstall<CR>
noremap <leader>pu :so $MYVIMRC<CR> :PlugUpdate<CR>
noremap <leader>pc :so $MYVIMRC<CR> :PlugClean<CR>

"lets not use ESC
imap jk <ESC>
imap kj <ESC>

"fuzzyfinder
nnoremap <leader>gf :GFiles<CR>
nnoremap <leader>ff :Files ~<CR>

"Netrw
nnoremap <leader>ex :Ex<cr>"

"Switch between bufferNext easier
nnoremap <leader><leader> :bNext<CR>

"Go to the settings
"_files -> _vim -> _dotfiles = fvd
nmap <leader>fvd :e $MYVIMRC<CR>

"substitute word under cursor
nmap <leader>sw :%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>

"CoC shortand
nmap <leader>coc :CocList marketplace<CR>

nmap <leader>al :call ToggleAlacrittyTheme()<cr>

"formating if we can
nmap <leader>fo :Format<CR>

"Gets rid of the highlightswhen you leave commandline
augroup vimrc-incsearch-highlight
	autocmd!
  	autocmd CmdlineEnter /,\? :set hlsearch
	autocmd CmdlineLeave /,\? :set nohlsearch
augroup END

"Set foldmethod based on filetype
augroup foldmethod-on-filetype
	au!
	au BufEnter *.py,*.sh,*.vim set foldmethod=indent
	au BufLeave *.py,*.sh,*.vim set foldmethod=syntax
augroup END

augroup do-not-autoformat-suckless
	au!
	au BufEnter config.def.h,config.h let g:clang_format#auto_format = 0
	au BufLeave config.def.h,config.h let g:clang_format#auto_format = 1
augroup END

"=============================================================
"							User Functions
"=============================================================

"see https://lib.rs/crates/alacritty-theme
"
" This function will set Vim's background to "light" or "dark"
" depending on if the current color scheme Alacritty is using
" has those keywords in its name.
function! AlignAlacrittyBackground()
	let &background = ( system('alacritty-theme current') =~ "light" ? "light" : "dark" )
  	hi Normal guibg=NONE ctermbg=NONE
endfunc

" This function will toggle Alacritty's color scheme back and
" forth between light and dark themes. 
function! ToggleAlacrittyTheme()
	if (system('alacritty-theme current') =~ "light")
	  	call system('alacritty-theme change one_dark')
	else
	  	call system('alacritty-theme change one_light')
	endif
	call AlignAlacrittyBackground()
endfunc

call AlignAlacrittyBackground()
