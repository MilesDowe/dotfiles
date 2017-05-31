" appearance
set nu
set autoindent
colorscheme blue
syntax on
set guifont=Consolas:h12

" Disable error bells
set noeb vb t_vb=

" search
set hlsearch
set incsearch

" tab / whitespace
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab

" hotkeys
nnoremap ; :

" mouse
set mouse=a

" Fix weird backspace issue
set backspace=2

" Tab stuff
nnoremap <C-t> :tabnew<CR>
nnoremap <C-tab> :tabnext<CR>
nnoremap <C-S-tab> :tabprevious<CR>
