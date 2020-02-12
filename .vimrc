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

" Customize how built-in netrw directory viewer appears;
" though, VimFiler is a real nice replacement
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 2
let g:netrw_altv = 1
let g:netrw_winsize = 25

set ic
set number
set relativenumber
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4
set autoindent
set nobackup
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

" ==================
" File backups
"   from: begriffs.com/posts/2019-07-19-history-use-vim.html
    " Protect changes between writes. Default values of update
    " (200 keystrokes) and updatetime (4 seconds) are fine.
" ==================
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
set updatetime=100


" ==================
" Custom button mapping
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
nnoremap <leader>t :term pwsh<cr>

" Refresh source
nnoremap <leader>r :source ~/.vimrc<cr>

" ---- F-keys ----
" Modify .vimrc
nnoremap <F12> :e ~/.vimrc<cr>

"=================
" Begin Plugin Configs
"=================
" VimFiler:
nnoremap <C-o> :VimFilerExplorer<cr>

" CtrlP: hotkey
nnoremap <C-p> :CtrlP .<cr>

" EasyMotion: cardinal movement
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)

let g:EasyMotion_startofline = 0 " keep cursor column when JK motion

" GitGutter: config
"au VimEnter * :GitGutterDisable " Disable GitGutter
let g:gitgutter_diff_args = '--ignore-cr-at-eol' " disable carriage-return changes

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
" ALE: python config
let g:ale_python_pylint_options = '--load-plugins 
" ALE: kotlin config
let g:ale_kotlin_kotlinc_classpath = "C:\Users\Miles\scoop\apps\kotlin\current\lib"
let g:ale_kotlin_kotlinc_sourcepath = "C:\Users\Miles\scoop\apps\kotlin\current\bin"

" UltiSnips: Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" UltiSnips: If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Specify target directory so `scoop` is not used
let g:UltiSnipsSnippetsDirectories=["C:\Users\Miles\vimfiles"]

" vim-sandwich:
let g:operator_sandwich_no_default_key_mappings = 1
map <leader>sa <Plug>(operator-sandwich-add)
map <leader>sd <Plug>(operator-sandwich-delete)
map <leader>sr <Plug>(operator-sandwich-replace)


"=================
" Begin helpful functions
"=================
" Prose, notetaking mode
function! ProseTimeOn()
    Limelight
    set filetype=markdown
    set guifont=courier\ new:h10
    PencilSoft
endfunction
command! ProseOn call ProseTimeOn()

function! ProseTimeOff()
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

"=================
" Begin file autogroups
"=================
augroup java
    autocmd!
    autocmd BufRead *.java set noexpandtab " use tabs
augroup END

augroup golang
    autocmd!
    autocmd BufRead *.go :set noexpandtab " use tabs
    autocmd QuitPre *.go :%!gofmt         " run formatter after close
augroup END

