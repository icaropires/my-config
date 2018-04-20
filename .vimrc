"=================================================
"                   GENERAL
"=================================================
set autoread
set bg=dark
set number
set ruler
set showcmd
set wildmenu
set wildmode=list:longest,full
set ttimeoutlen=10 " <esc> O

"=================================================
"                  INDENTATION
"=================================================
set autoindent 
set tabstop=4
set shiftwidth=4

"=================================================
"                    SEARCH
"=================================================
set incsearch  " Starts search while typing
set ignorecase
set smartcase  " Case sensitive if has upper

"=================================================
"                    FUNCTIONS
"=================================================
function! FindConfig(prefix, what, where)
    let cfg = findfile(a:what, escape(a:where, ' ') . ';')
    return cfg !=# '' ? ' ' . a:prefix . ' ' . shellescape(cfg) : ''
endfunction

"=================================================
"                    PLUGINS
"=================================================
call plug#begin()

"-------------------------------------------------
"                    GENERAL
"-------------------------------------------------
Plug 'w0rp/ale'
Plug 'maralla/completor.vim'

"-------------------------------------------------
"                    PYTHON
"-------------------------------------------------

" ALE
autocmd FileType python let g:ale_python_pylint_options =
		\ get(g:, 'ale_python_pylint_options', '') .
		\ FindConfig('--rcfile', '.pylintrc', expand('<afile>:p:h', 1))

let g:ale_python_pylint_options = '--load-plugins pylint_django'

" Completor
let g:completor_python_binary = '/path/to/python/with/jedi/installed'

"-------------------------------------------------
"                    C/C++
"-------------------------------------------------

"ALE
let g:completor_clang_binary = '/usr/bin/clang'

"-------------------------------------------------
"                   MARKDOWN
"-------------------------------------------------
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}

"-------------------------------------------------
"                  JAVASCRIPT
"-------------------------------------------------

Plug 'chemzqm/vim-jsx-improve', {'for': 'javascript'}
	let g:jsx_improve_motion_disable = 1

Plug 'ternjs/tern_for_vim'

" Completor
let g:completor_node_binary = '/home/icaro/.nvm/versions/node/v8.11.1/bin/node'

"-------------------------------------------------
"                     HTML
"-------------------------------------------------
Plug 'othree/html5.vim', {'for': 'html'}

" Initialize plugin system
call plug#end()
