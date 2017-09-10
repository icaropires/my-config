"=================================================
"                   GENERAL
"=================================================
set autoread
set bg=dark
set nu
set ruler
set showcmd
set mouse=a
set wildmenu
set wildmode=list:longest,full
set ttimeoutlen=10 " <esc> O
"set rnu "relativenumber

"=================================================
"                  INDENTATION
"=================================================
set ai 
set ts=4
set sw=4

"=================================================
"                    SEARCH
"=================================================
set incsearch  " Starts search while typing
set ignorecase " Case insensitive
set smartcase  " Case sensitive if has upper

"=================================================
"                   MAPPING
"=================================================
set pastetoggle=<F10>

nnoremap <S-Up> :res+1 <CR>
nnoremap <S-Down> :res-1 <CR>
nnoremap <S-Right> :vert res+1 <CR>
nnoremap <S-Left> :vert res-1 <CR>
nnoremap <F7> :SyntasticToggleMode <CR>

"=================================================
"                    DIFF
"=================================================

"=================================================
"                   PLUGINS
"=================================================

" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

"-------------------------------------------------
"                   GENERAL
"-------------------------------------------------

Plug 'vim-syntastic/syntastic'
	set statusline+=%#warningmsg#
	set statusline+=%{SyntasticStatuslineFlag()}
	set statusline+=%*

	let g:syntastic_always_populate_loc_list = 1
	let g:syntastic_auto_loc_list = 1
	let g:syntastic_check_on_wq = 0

Plug 'Valloric/YouCompleteMe', { 'do': './install.py --tern-completer --clang-completer'}
	let g:ycm_show_diagnostics_ui = 0 " Solves YCM X Syntastic incompability

Plug 'vim-airline/vim-airline'

"-------------------------------------------------
"                     Python
"-------------------------------------------------

" Syntastic
let g:syntastic_python_checkers=['pylint']

" YouCompleteMe
	" Python compiled with --enable-shared
		" $ export PYTHON_CONFIGURE_OPTS="--enable-shared"


"-------------------------------------------------
"                     C/C++
"-------------------------------------------------

Plug 'octol/vim-cpp-enhanced-highlight', { 'for': 'cpp' }
	let g:cpp_class_scope_highlight = 1
	let g:cpp_class_decl_highlight = 1
	let g:cpp_experimental_simple_template_highlight = 1 
	" let g:cpp_experimental_template_highlight = 1 " faster than above but experimental
	let g:cpp_concepts_highlight = 1
	let g:cpp_no_function_highlight = 0

Plug 'rhysd/vim-clang-format', { 'for': 'cpp' }
	let g:clang_format#detect_style_file = 1

" Syntastic
	let g:syntastic_cpp_compiler_options = ' -std=c++11'
	let g:syntastic_cpp_checkers=['gcc']
	let g:syntastic_cpp_cpplint_exec = "cpplint"
	
" YouCompleteMe
	"Needs
		" CMake
		" Clang
		" python3-dev
	let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_global_ycm_extra_conf.py'

"-------------------------------------------------
"                   MARKDOWN
"-------------------------------------------------

Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
Plug 'plasticboy/vim-markdown', {'for': 'markdown'}

"-------------------------------------------------
"                  JAVASCRIPT
"-------------------------------------------------

Plug 'chemzqm/vim-jsx-improve', {'for': 'javascript'}
	let g:jsx_improve_motion_disable = 1

" Syntastic - Eslint
let g:syntastic_javascript_checkers=['eslint']
let g:syntastic_javascript_eslint_exe = '[ -f $(npm bin)/eslint ] && $(npm bin)/eslint || eslint'

" Plug 'pangloss/vim-javascript', {'for': 'javascript'}

"-------------------------------------------------
"                     HTML
"-------------------------------------------------
Plug 'othree/html5.vim', {'for': 'html'}

" Initialize plugin system
call plug#end()
