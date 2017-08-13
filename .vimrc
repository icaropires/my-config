"=================================================
"                   GENERAL
"=================================================
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
nnoremap <F7> :SyntasticCheck <CR>

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

	let g:syntastic_mode_map = {"mode": "passive"}
	let g:syntastic_always_populate_loc_list = 1
	let g:syntastic_auto_loc_list = 1
	let g:syntastic_check_on_wq = 0

Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
	" Needs
		" CMake
		" Python compiled with --enable-shared
			" $ export PYTHON_CONFIGURE_OPTS="--enable-shared"
	let g:ycm_show_diagnostics_ui = 0 " Solves YCM X Syntastic incompability

"-------------------------------------------------
"                   MARKDOWN
"-------------------------------------------------

Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
Plug 'plasticboy/vim-markdown', {'for': 'markdown'}

"-------------------------------------------------
"                  JAVASCRIPT
"-------------------------------------------------
Plug 'ternjs/tern_for_vim', {'for': 'javascript'}
	"Beyond string based conversion for YCM
	
Plug 'chemzqm/vim-jsx-improve', {'for': 'javascript'}
	let g:jsx_improve_motion_disable = 1

" Plug 'pangloss/vim-javascript', {'for': 'javascript'}

"-------------------------------------------------
"                     HTML
"-------------------------------------------------
Plug 'othree/html5.vim', {'for': 'html'}

" Initialize plugin system
call plug#end()
