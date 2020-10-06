"=======================================================
" 				Auto-Commands
"=======================================================

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
