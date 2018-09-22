execute pathogen#infect()

syntax on
filetype plugin indent on

" set GUI stuff
if has ('gui_running')
    set guifont=Hack:h9:cANSI
    autocmd GUIEnter * set vb t_vb=
endif

" Neovim: Terminal manipulation
tnoremap <Esc> <C-\><C-n>

colorscheme gruvbox
set background=dark

set ic
set number
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4
set autoindent
set nobackup
set noswapfile
set nuw=6
set cursorline
set hidden
set smarttab
set incsearch
set copyindent
set hlsearch
set history=1000
set undolevels=1000
set noerrorbells

set guioptions-=m "remove menu bar
set guioptions-=T "remove toolbar
set guioptions-=r
set guioptions-=L

set colorcolumn=80

set updatetime=100

" Set button mapping and other functionality
nnoremap <C-pgup> :tabprevious<cr>
nnoremap <C-pgdn> :tabnext<cr>
nnoremap <C-t> :tabnew<cr>
inoremap <C-pgup> <ESC>:tabprevious<cr>i
inoremap <C-pgdn> <ESC>:tabnext<cr>i
inoremap <C-t> <ESC>:tabnew<cr>i

nnoremap ; :
nnoremap : <nop>

inoremap jk <esc> 
inoremap <esc> <nop>

inoremap <leader>chk - [ ] 

" Change between windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Change styles
nnoremap <Leader>markdown :set syntax=markdown<cr>
nnoremap <Leader>java :set syntax=java<cr>
nnoremap <Leader>python :set syntax=python<cr>
nnoremap <Leader>bash :set syntax=bash<cr>
nnoremap <Leader>rust :set syntax=rust<cr>

" CtrlP: hotkey
nnoremap <C-p> :CtrlP .<cr>

" EasyMotion: cardinal movement
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)

let g:EasyMotion_startofline = 0 " keep cursor column when JK motion

" Airline: config
set laststatus=2
let g:airline_left_sep      = ''
let g:airline_left_alt_sep  = ''
let g:airline_right_sep     = ''
let g:airline_right_alt_sep = ''

" Syntastic: config
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Signify config
let g:signify_vcs_list = ['git', 'svn']

let g:signify_cursorhold_insert     = 1
let g:signify_cursorhold_normal     = 1
let g:signify_update_on_bufenter    = 0
let g:signify_update_on_focusgained = 1

" Language things
autocmd FileType java       :iabbrev <buffer> iff if () {<left><left><left>
autocmd FileType python     :iabbrev <buffer> iff if :<left>
autocmd FileType javascript :iabbrev <buffer> iff if () {<left><left><left>


function! ProseTimeOn()
    Goyo
    set background=light
    Limelight
    PencilSoft
    set filetype=markdown
endfunction
function! ProseTimeOff()
    Goyo!
    set background=dark
    Limelight!
    PencilOff
endfunction
command! ProseOn call ProseTimeOn()
command! ProseOff call ProseTimeOff()
