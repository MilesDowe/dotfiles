execute pathogen#infect()

syntax on
filetype plugin indent on

colorscheme gruvbox
set background=dark
set guifont=Hack:h10

" Stop the beeping
set noeb vb t_vb=

" Directory navigation
" Open files in a new view (1 = horiz, 2 = vert, 3 = tab)
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 2
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

set guioptions-=m "remove menu bar
set guioptions-=T "remove toolbar
set guioptions-=r
set guioptions-=L

set colorcolumn=80

set updatetime=100

" Press Ctrl+R while in visual mode to search for selected text
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

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

" I use this motion to add the current date as header2. Primarily
"   used for a "done.md" file when knocking off todo items.
nnoremap <leader>tdd :put=strftime('## %a, %Y.%m.%d ##')<cr>

" Change between windows (does not work with Vim built-in terminal)
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Copy pasting
vnoremap <C-c> "*y
vnoremap <C-x> "*x

" Change styles
nnoremap <Leader>markdown :set syntax=markdown<cr>
nnoremap <Leader>java :set syntax=java<cr>
nnoremap <Leader>json :set syntax=json<cr>
nnoremap <Leader>python :set syntax=python<cr>
nnoremap <Leader>bash :set syntax=bash<cr>
nnoremap <Leader>rust :set syntax=rust<cr>

"-----------------
" BEGIN: Plugin configs
"-----------------
" UltiSnips: Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" UltiSnips: If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetsDirectories=["C:\Users\mdowe\vimfiles\bundles"]

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

" Lightline: config
let g:lightline =  {
\ 'colorscheme' : 'gruvbox',
\}

" ALE: config
let g:ale_lint_on_text_changed = 'never' " Only refresh on save
let g:ale_linters = {
\  'text':['write-good', 'proselint'],
\  'cpp':['cppcheck', 'cpplint', 'clang', 'gcc', 'flawfinder'],
\}

" wiki.vim: config
let g:wiki_root = '~/Documents/knowledge_base' " Can change this location to whatever
let g:wiki_filetypes = ['md']
let g:wiki_link_target_type = 'md'
let g:wiki_link_extension = 'md'
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

" Create a list of numbers within the given range
function! NumList(start, stop)
    put =range(a:start, a:stop)
endfunction

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
