"=============================================================
"							vim-plug
"=============================================================
call plug#begin('~/.vim/plugged')
"themes
Plug 'dracula/vim'
Plug 'rakr/vim-one'

"tools
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dense-analysis/ale'
Plug 'vim-airline/vim-airline'
Plug 'lilydjwg/colorizer'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'rhysd/vim-clang-format'
Plug 'rust-lang/rust.vim'
Plug 'unblevable/quick-scope'
Plug 'vim-scripts/DoxygenToolkit.vim'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mhinz/vim-signify'
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}

call plug#end()
