" Language specific files

augroup gofiles
	autocmd!
	" run formatter before opening
	autocmd BufRead *.go :%!gofmt
	autocmd BufRead,BufNewFile *.go packadd coc.nvim
augroup end

augroup pythonfiles
	autocmd!
	autocmd BufRead,BufNewFile *.py set expandtab " use spaces
	autocmd BufRead,BufNewFile *.py set tabstop=4 " 4 spaces is idiomatic
	autocmd BufRead,BufNewFile *.py set softtabstop=4
	autocmd BufRead,BufNewFile *.py set shiftwidth=0
	autocmd BufRead,BufNewFile *.py packadd coc.nvim
augroup end

augroup javascriptfiles
	autocmd!
	autocmd BufRead,BufNewFile *.js set expandtab " use spaces
	autocmd BufRead,BufNewFile *.js packadd coc.nvim
augroup end

augroup typescriptfiles
	autocmd!
	autocmd BufRead,BufNewFile *.ts set expandtab " use spaces
	autocmd BufRead,BufNewFile *.ts packadd coc.nvim
augroup end

augroup bashfiles
	autocmd!
	" Avoid using CRLF
	autocmd BufRead,BufNewFile *.sh set fileformat=unix
	autocmd BufRead,BufNewFile *.sh packadd coc.nvim
augroup end

augroup ps1files
	autocmd!
	autocmd BufRead,BufNewFile *.ps1 packadd vim-ps1
	autocmd BufRead,BufNewFile *.kt packadd coc.nvim
augroup end

augroup kotlinfiles
	autocmd!
	autocmd BufRead,BufNewFile *.kt packadd kotlin-vim
	autocmd BufRead,BufNewFile *.kt packadd coc.nvim
augroup end


" Template files

augroup postmortemfiles
	autocmd!
	autocmd BufNewFile postmortem*.md 0r ~/scripts/templates/postmortem.md
augroup end

augroup bugsummaryfiles
	autocmd!
	autocmd BufNewFile bug*.md 0r ~/scripts/templates/bug.md
augroup end
