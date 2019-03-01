execute pathogen#infect()

syntax on
filetype plugin indent on

colorscheme gruvbox
set background=dark

" Neovim terminal shortcuts
tnoremap <esc> <C-\><C-n>
" Neovim shift+insert fix
"   Stolen from: https://jdhao.github.io/2018/11/15/neovim_configuration_windows/
inoremap <silent> <S-Insert> <C-R>+

" Directory navigation
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 2   " Open files in a new view (1 = horiz, 2 = vert, 3 = tab)
let g:netrw_altv = 1
let g:netrw_winsize = 25

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

" For quick searching of selected text
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

inoremap <leader>chk - [ ] 

" Change between windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Copy pasting
vnoremap <C-c> *"y
vnoremap <C-x> "*x

" Change styles
nnoremap <Leader>markdown :set syntax=markdown<cr>
nnoremap <Leader>java :set syntax=java<cr>
nnoremap <Leader>python :set syntax=python<cr>
nnoremap <Leader>bash :set syntax=bash<cr>
nnoremap <Leader>rust :set syntax=rust<cr>

" Language things (experiments from "Learning VimScript the Hard Way")
"autocmd FileType java       :iabbrev <buffer> iff if () {<left><left><left>
"autocmd FileType python     :iabbrev <buffer> iff if :<left>
"autocmd filetype javascript :iabbrev <buffer> iff if () {<left><left><left>


"-----------------
" BEGIN: Plugin configs
"-----------------
" CtrlP: hotkey
nnoremap <C-p> :CtrlP .<cr>

" EasyMotion: cardinal movement
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)

let g:EasyMotion_startofline = 0 " keep cursor column when JK motion

" GitGutter: config
au VimEnter * :GitGutterDisable " Disable GitGutter

" Airline: config
set laststatus=2
let g:airline_left_sep      = ''
let g:airline_left_alt_sep  = ''
let g:airline_right_sep     = ''
let g:airline_right_alt_sep = ''

" Syntastic: config
au VimEnter * :SyntasticToggleMode " Disable Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Lightline: config
let g:lightline = {
\ 'colorscheme': 'wombat',
\ }

" ALE: config
let g:ale_lint_on_text_changed = 'never'
let g:ale_linters = {'text': ['write-good']} " First, `npm install -g write-good`
"-----------------
" END: Plugin configs
"-----------------



" Prose, notetaking mode
function! ProseTimeOn()
    Goyo
    set background=light
    Limelight
    PencilSoft
    set filetype=markdown
endfunction
command! ProseOn call ProseTimeOn()

function! ProseTimeOff()
    Goyo!
    set background=dark
    Limelight!
    PencilOff
endfunction
command! ProseOff call ProseTimeOff()

" Create a list of numbers within the given range, start and stop inclusive
function! NumList(start, stop)
    put =range(a:start, a:stop)
endfunction
"command! -nargs=1 numlist call s:MakeNumberList(<f-args>)

" Create a commands for cleaning up XML & JSON (assumes Py3 installed)
function! CleanUpXml()
    set syntax=xml
    %!python3 -c "import xml.dom.minidom, sys; print(xml.dom.minidom.parse(sys.stdin).toprettyxml())"
    g/^[\t ]*$/d
endfunction
command! FormatXML call CleanUpXml()

function! CleanUpJson()
    set syntax=json
    %!python3 -m json.tool
endfunction
command! FormatJSON call CleanUpJson()
