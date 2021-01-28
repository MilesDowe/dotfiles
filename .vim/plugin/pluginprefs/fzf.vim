" Simplify some of the commands
nnoremap <silent> <leader>; :History:<CR>
nnoremap <silent> <leader>/ :History/<CR>
nnoremap <silent> <leader>m :Marks<CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>g :GFiles<CR>

nnoremap <silent> <leader><tab> :Snippets<CR>
inoremap <silent> <esc><leader><tab> :Snippets<CR>

" Pop-up window setting not appearing to work with
" Windows setup.
"let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
