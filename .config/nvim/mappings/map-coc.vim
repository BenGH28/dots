nnoremap <Leader>cm :CocList marketplace<CR>
nnoremap <Leader>cc :CocConfig<CR>

" Use <Tab> and <S-Tab> to navigate through completion popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
