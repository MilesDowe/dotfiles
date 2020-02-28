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
