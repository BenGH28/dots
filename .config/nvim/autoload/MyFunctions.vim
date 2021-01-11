"=============================================================
"							User Functions
"=============================================================

"see https://lib.rs/crates/alacritty-theme
"
" This function will set Vim's background to "light" or "dark"
" depending on if the current color scheme Alacritty is using
" has those keywords in its name.
function! MyFunctions#AlignAlacrittyBackground()
	let &background = ( system('alacritty-theme current') =~ "light" ? "light" : "dark" )
  	hi Normal guibg=NONE ctermbg=NONE
endfunc

" This function will toggle Alacritty's color scheme back and
" forth between light and dark themes. 
function! MyFunctions#ToggleAlacrittyTheme()
	if (system('alacritty-theme current') =~ "light")
	  	call system('alacritty-theme change one_dark')
	else
	  	call system('alacritty-theme change one_light')
	endif
	call MyFunctions#AlignAlacrittyBackground()
endfunc

