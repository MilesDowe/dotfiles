execute pathogen#infect()

" set GUI stuff
if has ('gui_running')
    set guifont=Hack:h9:cANSI
    autocmd GUIEnter * set vb t_vb=
endif

syntax on
filetype plugin indent on

" LaTeX stuff
set shellslash
let g:tex_flavor='latex'

colorscheme zenburn " gruvbox neodark
set background=dark

" Stop the beeping
set noeb vb t_vb=

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

" File backups
"   from: begriffs.com/posts/2019-07-19-history-use-vim.html
    " Protect changes between writes. Default values of update
    " (200 keystrokes) and updatetime (4 seconds) are fine.
set swapfile
set directory^=~/vimfiles/swap//
    " protect against crash-during-write
set writebackup
    " but do not persist backup after successful write 
set nobackup
    " use rename-and-write-new method whenever safe
set backupcopy=auto
    " patch required to honor double slash at end
if has("patch-8.1.0.251")
    " consolidate writebackups
    set backupdir^=~/vimfiles/backup//
end
    " persist the undo tree for each file
set undofile
set undodir^=~/vimfiles/undo//

set colorcolumn=100

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

" Press Ctrl+R while in visual mode to search for selected text
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

" I use this motion to add the current date as header-2. Primarily
" used for a "done.md" file when knocking off todo items.
nnoremap <leader>tdd :put=strftime('## %a, %Y.%m.%d ##')<cr>

" Change between windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Copy pasting
vnoremap <C-c> "*y
vnoremap <C-x> "*x
nnoremap <C-a> ggVG

" Saving (<C-s> is reserved in Linux shells)
nnoremap <C-s> :w<cr>
inoremap <C-s> <esc>:w<cr>

" Begin Plugin Configs
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

" ALE: config
let g:ale_lint_on_text_changed = 'never'
"let g:ale_linters = {'text': ['write-good','vale','textlint','proselint','languagetool','alex','redpen']}
let g:ale_fixers = {
            \ '*': ['remove_trailing_lines', 'trim_whitespace'],
            \ 'go': ['gofmt', 'goimports']
\}

" UltiSnips: Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" UltiSnips: If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Specify target directory so `scoop` is not used
let g:UltiSnipsSnippetsDirectories=["C:\Users\Miles\vimfiles"]
"-----------------


" Prose, notetaking mode
function! ProseTimeOn()
    Goyo
    "set background=light
    Limelight
    set filetype=markdown
    set guifont=courier\ new:h10
    PencilSoft
endfunction
command! ProseOn call ProseTimeOn()

function! ProseTimeOff()
    Goyo!
    "set background=dark
    Limelight!
    set guifont=hack:h10
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
    %!python -c "import xml.dom.minidom, sys; print(xml.dom.minidom.parse(sys.stdin).toprettyxml())"
    g/^[\t ]*$/d
endfunction
command! XMLFormat call CleanUpXml()

function! CleanUpJson()
    set syntax=json
    %!python -m json.tool
endfunction
command! JSONFormat call CleanUpJson()

function! PowershellDefault()
    edit term://powershell
endfunction
command! UseTerm call PowershellDefault()
