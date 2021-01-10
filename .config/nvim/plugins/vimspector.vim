let g:vimspector_install_gadgets = ['debugpy', 'vscode-cpptools', 'CodeLLDB']
nmap <Leader>rt :call vimspector#Launch()<CR>
nmap <Leader>rk :VimspectorReset<CR>
