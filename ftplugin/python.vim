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

nnoremap <S-F7> :! clear && autopep8 --in-place --aggressive --aggressive % --fix <CR> :e! <CR>
