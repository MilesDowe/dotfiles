" ==================
" Button re-mapping and shortcuts
" ==================

" Tabs
nnoremap <C-pgup> :tabprevious<cr>
nnoremap <C-pgdn> :tabnext<cr>
nnoremap <C-t> :tabnew<cr>
inoremap <C-pgup> <ESC>:tabprevious<cr>i
inoremap <C-pgdn> <ESC>:tabnext<cr>i
inoremap <C-t> <ESC>:tabnew<cr>i

" Switching modes
nnoremap ; :
nnoremap : <nop>

inoremap jk <esc>
inoremap <esc> <nop>

" Press Ctrl+R while in visual mode to search for selected text
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

" I use this motion to add the current date as header-2. Primarily
" used for a `done.md` file when knocking off todo items.
nnoremap <leader>d :put=strftime('## %a, %Y.%m.%d ##')<cr>

" Change between windows
nnoremap <A-S-h> <C-w>h
nnoremap <A-S-j> <C-w>j
nnoremap <A-S-k> <C-w>k
nnoremap <A-S-l> <C-w>l
tnoremap <A-S-h> <C-w>h
tnoremap <A-S-j> <C-w>j
tnoremap <A-S-k> <C-w>k
tnoremap <A-S-l> <C-w>l

" Copy pasting
vnoremap <C-c> "*y
vnoremap <C-x> "*x
nnoremap <C-a> ggVG

" Tag navigation
" <C-]> is go to a tag, so feel it makes sense to make <C-[> go back
" NOTE: causes funkiness in Unix (writes to command after opening)
nnoremap <C-[> :pop<cr>

" Terminal
nnoremap <leader>t :term ++close pwsh<cr>

" Refresh source
nnoremap <leader>r :source ~/.vimrc<cr>:source ~/.gvimrc<cr>

" Better terminal escaping
tnoremap <ESC> <C-\><C-n>

" ------------------------
" F-keys
" ------------------------
" Modify .vimrc
" nnoremap <F12> :e ~/.vimrc<cr> (Unused since refactoring)

" ------------------------
" Mergetool
" ------------------------
nnoremap theirs :diffg REMOTE<cr>
":diffg BA  " get from BASE
nnoremap mine :diffg LOCAL<cr>
