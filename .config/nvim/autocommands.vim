"=======================================================
" 				Auto-Commands
"=======================================================

"Gets rid of the highlightswhen you leave commandline
augroup vimrc-incsearch-highlight
	au!
  	au CmdlineEnter /,\? :set hlsearch
	au CmdlineLeave /,\? :set nohlsearch
augroup END

"Set foldmethod based on filetype
augroup foldmethod-on-filetype
	au!
	au BufEnter *.py,*.sh,*.vim set foldmethod=indent
	au BufLeave *.py,*.sh,*.vim set foldmethod=syntax
augroup END

augroup quick-scope-colours
	au!
	au ColorScheme * highlight QuickScopePrimary guifg='#61afe0' gui=underline ctermfg=155 cterm=underline
	au ColorScheme * highlight QuickScopeSecondary guifg='#98d379' gui=underline ctermfg=81 cterm=underline
augroup END

augroup cpp-indent
	au!
	au BufEnter *.cpp :set tabstop=2 | :set shiftwidth=2
	au BufLeave *.cpp :set tabstop=4 | :set shiftwidth=4
augroup END

"auto PlugInstall
autocmd VimEnter *
			\ if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
			\| PlugInstall --sync | q
			\|endif

" augroup keep-transparent-terminal
" 	au!
" 	au BufEnter * hi Normal guibg=NONE ctermbg=NONE
" augroup END
