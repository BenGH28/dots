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

augroup do-not-autoformat-suckless
	au!
	au BufEnter config.def.h,config.h let g:clang_format#auto_format = 0
	au BufLeave config.def.h,config.h let g:clang_format#auto_format = 1
augroup END

augroup quick-scope-colours
	au!
	au ColorScheme * highlight QuickScopePrimary guifg='#61afe0' gui=underline ctermfg=155 cterm=underline
	au ColorScheme * highlight QuickScopeSecondary guifg='#98d379' gui=underline ctermfg=81 cterm=underline
augroup END

augroup keep-transparent-terminal
	au!
	au BufEnter * hi Normal guibg=NONE ctermbg=NONE
augroup END
