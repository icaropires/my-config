"=================================================
"                    GERAL
"=================================================
setlocal colorcolumn=79
setlocal textwidth=79
highlight ColorColumn ctermbg=gray

"=================================================
"                  IDENTAÇÃO
"=================================================
setlocal sw=4
setlocal ts=4
setlocal et

"=================================================
"                   MAPPING
"=================================================

nnoremap <F3> :! clear && autopep8 --in-place --aggressive % <CR> :e! <CR>
nnoremap <F2> :! clear && python3 % <CR>
