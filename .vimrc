" ------------------------
" This is the primary RC file, containing some simple changes.
"
" Additional configurations can be found under:
"   `{VIMDIR}/plugin`
" ------------------------

syntax on
filetype plugin indent on

" LaTeX stuff
set shellslash
let g:tex_flavor='latex'

" ==================
" Appearances
" ==================
colorscheme elflord

set colorcolumn=100

" Stop the beeping
set noeb vb t_vb=

set ic
set number
set relativenumber
set tabstop=2
set softtabstop=2
set shiftwidth=0
set noexpandtab   " Use tabs (we specify otherwise for dependent languages)
set autoindent
set nuw=6
set hidden
set smarttab
set incsearch
set copyindent
set hlsearch
set history=1000
set undolevels=1000
set noerrorbells

"=================
" Begin helpful functions
"=================
" Create a list of numbers within the given range
function! NumList(start, stop)
    put =range(a:start, a:stop)
endfunction

