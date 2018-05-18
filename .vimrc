execute pathogen#infect()

set runtimepath^=~/vimfiles/bundle/ctrlp.vim

set laststatus=2

if !has('gui_running')
  set t_Co=256
endif

" because of lightline
set noshowmode

" Neovim: Terminal emulator map
tnoremap <Esc> <C-\><C-n> 

"" appearance
let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ }
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1
set nu
set autoindent
colorscheme gruvbox
set background=dark
syntax on
set guifont=Consolas:h12
set guioptions-=T   " remove toolbar
set guioptions-=r   " remove scrollbar
set guioptions-=L   " remove left scrollbar
set colorcolumn=80

set updatetime=100

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

"CtrlP: re-map
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP .'

" mouse
set mouse=a

" Fix weird backspace issue
set backspace=2

" Tab stuff
nnoremap <C-t> :tabnew<CR>
nnoremap <C-tab> :tabnext<CR>
nnoremap <C-S-tab> :tabprevious<CR>

" EasyMotion: Easy cardinal movement
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)
let g:EasyMotion_startofline = 0 " keep cursor column when JK motion

" GitGutter: find git?
let g:gitgutter_git_executable = '"C:\Program Files\Git\bin\git.exe"'
let g:gitgutter_enabled = 1

" Functions
function! DoFormatXML()
    % !C:/Users/mdowe/vimfiles/xmllint.exe "%" --format
endfunction
command! FormatXML call DoFormatXML()

function! Prosetime()
    Goyo
    colorscheme desert
endfunction
command! Prose call Prosetime()

function! NoteTime()
    Goyo 80x200
    Limelight
endfunction
command! Notes call NoteTime()
