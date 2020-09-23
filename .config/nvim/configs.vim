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
