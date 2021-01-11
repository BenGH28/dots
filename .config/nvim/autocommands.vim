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
	au BufLeave *.py,*.sh,*.vim set foldmethod=expr
augroup END

augroup quick-scope-colours
	au!
	au ColorScheme * highlight QuickScopePrimary guifg='#61afe0' gui=underline ctermfg=155 cterm=underline
	au ColorScheme * highlight QuickScopeSecondary guifg='#98d379' gui=underline ctermfg=81 cterm=underline
augroup END

augroup cpp
	au!
	au BufEnter *.h,*.hpp,*.cc,*.cpp set tabstop=2 | set shiftwidth=2 | nnoremap <buffer> <silent> <Leader>sh :CocCommand clangd.switchSourceHeader<CR>
	au BufLeave *.h,*.hpp,*.cc,*.cpp set tabstop=4 | set shiftwidth=4 | nunmap <buffer> <Leader>sh
augroup END

"auto PlugInstall
augroup vim-plug
	au!
	au VimEnter *
			\ if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
			\| PlugInstall --sync | q
			\|endif
augroup END

"whitespace must die
augroup white-space
	au!
	au BufWritePre * %s/\s\+$//e
augroup END
