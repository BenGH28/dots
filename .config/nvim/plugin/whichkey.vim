"autocmd! User vim-which-key call which_key#register('<Space>', "g:which_key_map")
nnoremap <silent> <Leader> :WhichKey '<Space>'<CR>

let g:which_key_map = {}
let g:which_key_display_names = {'<CR>': '↵', '<TAB>': '⇆'}

let g:which_key_map['.'] = 'next tab'
let g:which_key_map[','] = 'previous tab'

let g:which_key_map.a = {
			\'name' : '+theme',
			\'l' : 'light background',
			\'d' : 'dark background',
			\'t' : 'match alacritty theme',
			\}

let g:which_key_map.b = {
			\'name' : '+buffers',
			\'n' : 'next',
			\'p' : 'previous'
			\}

let g:which_key_map.c = {
			\'name' : '+coc',
			\'m' : 'marketplace',
			\'c' : 'config',
			\'l' : {
				\'name' : '+List',
				\'d' : 'diagnostics',
				\'e' : 'extensions',
				\'c' : 'commands',
				\'o' : 'outline',
				\'s' : 'symbols',
				\'p' : 'resume',
				\}
			\}

let g:which_key_map.d = 'doxygen'

let g:which_key_map.e = 'execute'

let g:which_key_map.f = {
			\'name' : '+files',
			\'o' : 'format',
			\'v' : 'open vimrc',
			\'d' : 'fzf directory',
			\'f' : 'fzf ~',
			\'l' : 'list buffers',
			\'r' : 'ranger',
			\'n' : ['NERDTreeToggle', 'Open NerdTree'],
			\'q' : 'quit',
			\'w' : {
				\'name' : '+write',
				\'w': 'save',
				\'q': 'save & quit',
				\}
			\}

let g:which_key_map.g = {
			\'name' : '+git',
			\'s' : 'stage',
			\'m' : 'commit',
			\'p' : {
				\'name' : '+push/pull',
				\'l' : 'pull',
				\'s' : 'push'
				\}
			\}

let g:which_key_map.l = { 
			\'name' : '+lsp',
			\'n' : 'rename',
			\'f' : 'format selected',
			\'a' : 'Code Action Selected',
			\'c' : 'Code Action',
			\'q' : 'apply auto fix',
			\}

let g:which_key_map.m = {
			\'name' : '+make',
			\'a' : 'all',
			\'c' : 'clean',
			\}

let g:which_key_map.s = {
			\'name' : '+substitute',
			\'w' : 'word'}

let g:which_key_map.t = {
			\'name' : '+floaterm',
			\'p' : 'previous',
			\'n' : 'new',
			\'x' : 'next',
			\'h' : 'hide',
			\'k' : 'kill',
			\}

let g:which_key_map.p = {
			\'name': '+plug',
			\'i': 'install',
			\'u': 'update',
			\'c': 'clean',
			\'g': 'upgrade'
			\}

let g:which_key_map.v = 'source vimrc'

let g:which_key_map.w = {
			\'name' : '+window',
			\'h' : 'decrease width',
			\'j' : 'increase height',
			\'k' : 'decrease height',
			\'l' : 'increase width',
			\'=' : 'balance',
			\'o' : 'show only current window'
			\}

call which_key#register('<Space>', "g:which_key_map")
