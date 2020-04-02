" CtrlP preferences

nnoremap <C-p> :CtrlP .<cr>

" Ignore large files/dependencies
let g:ctrlp_custom_ignore = {
\	'dir': '\v[\/](node_modules)$',
\ 'file': '\v\.(exe)$',
\ }
