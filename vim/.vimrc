"=================================================
"                   GENERAL
"=================================================
set autoread
set number
set bg=dark
set ruler
set showcmd
set wildmenu
set wildmode=list:longest,full
set nowrap
set ttimeoutlen=10 " <esc> O
set expandtab

if has('nvim')
else
    colorscheme my
endif

"=================================================
"                  INDENTATION
"=================================================
set autoindent 
set tabstop=4
set shiftwidth=4
filetype plugin indent on

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
    let g:ale_linters = {
    \   'cpp': ['clang', 'gcc'],
    \}
	let g:airline#extensions#ale#enabled = 1

" Deoplete
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins', 'for': 'go'}
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1
autocmd CompleteDone * silent! pclose! " Autoclose preview window

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'chr4/nginx.vim'
" Plug 'vim-airline/vim-airline'

"-------------------------------------------------
"                    PYTHON
"-------------------------------------------------

" Plug 'python-mode/python-mode', {'for': 'python'}
	let g:pymode_python = 'python3'	

" ALE
autocmd FileType python let g:ale_python_pylint_options =
		\ get(g:, 'ale_python_pylint_options', '') .
		\ FindConfig('--rcfile', '.pylintrc', expand('<afile>:p:h', 1))

let g:ale_python_pylint_options = '--load-plugins pylint_django'

" Deoplete
Plug 'zchee/deoplete-jedi'

"-------------------------------------------------
"                    ELIXIR
"-------------------------------------------------
Plug 'elixir-editors/vim-elixir'

"-------------------------------------------------
"                    C/C++
"-------------------------------------------------

"-------------------------------------------------
"                    ELM
"-------------------------------------------------
Plug 'elmcast/elm-vim'
	let g:ycm_semantic_triggers = {
		 \ 'elm' : ['.'],
		 \}
let g:elm_format_autosave = 1

command! ElmFormat call elm#Format()
command! -nargs=? -complete=file ElmMake call elm#Make(<f-args>)

" Deoplete
Plug 'pbogut/deoplete-elm'

"-------------------------------------------------
"                    GO
"-------------------------------------------------
Plug 'mdempsky/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }
Plug 'zchee/deoplete-go', { 'do': 'make'}
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

"-------------------------------------------------
"                    HASKELL
"-------------------------------------------------
Plug 'eagletmt/neco-ghc'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': './install.sh'
    \ }

"-------------------------------------------------
"                   MARKDOWN
"-------------------------------------------------
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
Plug 'plasticboy/vim-markdown'

"-------------------------------------------------
"                    LATEX
"-------------------------------------------------
Plug 'lervag/vimtex'

"-------------------------------------------------
"                  JAVASCRIPT
"-------------------------------------------------

Plug 'chemzqm/vim-jsx-improve', {'for': 'javascript'}
	let g:jsx_improve_motion_disable = 1

Plug 'ternjs/tern_for_vim', {'for': 'javascript'}

"-------------------------------------------------
"                     HTML
"-------------------------------------------------
Plug 'othree/html5.vim', {'for': 'html'}

" Initialize plugin system
call plug#end()
