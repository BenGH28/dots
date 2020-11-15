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
Plug 'vim-ctrlspace/vim-ctrlspace'
" tags
Plug 'xolox/vim-easytags'
Plug 'xolox/vim-misc'
Plug 'majutsushi/tagbar'

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
set notimeout  timeoutlen=500 
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

"=============================================================
"							Plugin-Configs
"=============================================================
"Vim-clang-format config
let g:clang_format#code_style = 'google'

"Rust-lang config
let g:rustfmt_autosave = 1

"airline config
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#whitespace#checks = []

if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰ '
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.dirty='⚡'

"Easy align config
"easy align in visual mode (ex. vipga select inner paragraph easy align)
xmap ga <Plug>(EasyAlign)
"interactive mode for a motion/text object (ex.gaip = ga (easy align) inner
"paragraph)
nnoremap ga <Plug>(EasyAlign)

"Quick scope config
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
let g:qs_max_chars=150

"DoxygenToolkit config
let g:DoxygenToolkit_briefTag_pre="@Synopsis  "
let g:DoxygenToolkit_paramTag_pre="@Param "
let g:DoxygenToolkit_returnTag="@Returns   "
let g:DoxygenToolkit_authorName="Ben Hunt"

"fzf 
let $FZF_DEFAULT_COMMAND="rg --files --hidden --ignore-case"
let $FZF_DEFAULT_OPTS="--height 35% --layout=reverse --preview 'cat {}'"
let g:fzf_layout = {'down': '35%'}

"Ranger
"to see dotfiles hit 'zh'
let g:rnvimr_ex_enable = 1

"Ale
let g:ale_disable_lsp  = 1
let g:ale_sign_error   = '✗'
let g:ale_sign_warning = '❗'

source ~/.config/nvim/coc.vim
"Markdown
let g:instant_markdown_autostart = 0
let g:instant_markdown_allow_external_content = 1
let g:instant_markdown_logfile = '/tmp/instant_markdown.log'
let g:instant_markdown_browser = "firefox --new-window"
let g:instant_markdown_autoscroll = 0

"ctrlspace
let g:CtrlSpaceDefaultMappingKey = "<Leader><Leader>"
if executable("ag")
	let g:CtrlSpaceGlobCommand = 'ag -l --hidden --nocolor -g ""'
endif
let g:CtrlSpaceUseTabline = 1
let g:CtrlSpaceFileEngine = "auto"

"=============================================================
"							User Configs/Mappings
"=============================================================
"run make/binary
nnoremap <Leader>m :!make<CR>
nnoremap <Leader>c :!make clean<CR>
nnoremap <Leader>rb :!./

"set background quickly if I'm not using alacritty
nnoremap <silent> <Leader>bl :set background=light<CR>
nnoremap <silent> <Leader>bd :set background=dark<CR>

"source vimrc
nnoremap <Leader>so :source $MYVIMRC<CR>

"split windows
nnoremap <silent> <C-h> :wincmd h<CR>
nnoremap <silent> <C-j> :wincmd j<CR>
nnoremap <silent> <C-k> :wincmd k<CR>
nnoremap <silent> <C-l> :wincmd l<CR>

"resizing splits
nnoremap <Leader>h :vertical resize -3<CR>
nnoremap <Leader>j :resize -3<CR>
nnoremap <Leader>k :resize +3<CR>
nnoremap <Leader>l :vertical resize +3<CR>
nnoremap <Leader>= <C-W>=

"launch Doxygen quickly
nnoremap <Leader>do <ESC>:Dox<CR>

"Vim-Plug bindings
nnoremap <Leader>pi :so $MYVIMRC<CR> :PlugInstall<CR>
nnoremap <Leader>pu :so $MYVIMRC<CR> :PlugUpdate<CR>
nnoremap <Leader>pc :so $MYVIMRC<CR> :PlugClean<CR>

"lets not use ESC
inoremap jk <ESC>
inoremap kj <ESC>

"formating if we can
nnoremap <Leader>fo :Format<CR>

"Go to the settings
"_files -> _vim -> _dotfiles = fvd
nnoremap <Leader>fvd :e $MYVIMRC<CR>

"fuzzyfinder
"_files -> _directory
nnoremap <silent> <Leader>fd :Files<CR>
"search from $HOME
"_files -> _find
nnoremap <silent> <Leader>ff :Files ~<CR>
nnoremap <silent> <Leader>fl :Buffers<CR>

"Ranger
"_files -> _ranger
nnoremap <Leader>fr :RnvimrToggle<CR>"

"_files -> _write
nnoremap <Leader>fww :w<CR>
nnoremap <Leader>fwq :wq<CR>
nnoremap <Leader>fq :q<CR>

"Tagbar
nmap <Leader>ft :TagbarToggle<CR>

"Switch between buffers easier
nnoremap <silent> <Leader>bn :bNext<CR>
nnoremap <silent> <Leader>bp :bprevious<CR>

"Switch between Tabs easy-peasy
nnoremap <silent> <Leader><Tab> :tabn<CR>
nnoremap <silent> <Leader><S-Tab> :tabp<CR>

"substitute word under cursor
nnoremap <Leader>sw :%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>

"CoC shortand
nnoremap <Leader>coc :CocList marketplace<CR>

"alacritty themes
nnoremap <Leader>al :call ToggleAlacrittyTheme()<CR>

" Use <Tab> and <S-Tab> to navigate through completion popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

"Floaterm
let g:floaterm_keymap_new = '<Leader>tn'
let g:floaterm_keymap_prev = '<Leader>tp'
let g:floaterm_keymap_next = '<Leader>tx'
let g:floaterm_keymap_hide = '<Leader>th'
let g:floaterm_keymap_toggle = '<Leader>tt'
let g:floaterm_keymap_kill = '<Leader>tk'
