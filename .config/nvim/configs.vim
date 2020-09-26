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
let g:airline#extentions#ale#enabled = 1

"Easy align config
"easy align in visual mode (ex. vipga select inner paragraph easy align)
xmap ga <Plug>(EasyAlign) 
"interactive mode for a motion/text object (ex.gaip = ga (easy align) inner
"paragraph)
nmap ga <Plug>(EasyAlign)

"Quick scope config
" Trigger a highlight in the appropriate direction when pressing these keys:
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
let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'highlight': 'Todo', 'border': 'sharp' } }
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
