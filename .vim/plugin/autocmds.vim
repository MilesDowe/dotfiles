" Language specific files

augroup gofiles
	autocmd!
	" run formatter before opening
	autocmd BufRead *.go :%!gofmt
augroup end

augroup pythonfiles
	autocmd!
	autocmd BufRead,BufNewFile *.py set expandtab " use spaces
	autocmd BufRead,BufNewFile *.py set tabstop=4 " 4 spaces is idiomatic
	autocmd BufRead,BufNewFile *.py set softtabstop=4
	autocmd BufRead,BufNewFile *.py set shiftwidth=0
augroup end

augroup javascriptfiles
	autocmd!
	autocmd BufRead,BufNewFile *.js set expandtab " use spaces
augroup end

augroup bashfiles
	autocmd!
	" Avoid using CRLF
	autocmd BufRead,BufNewFile *.sh set fileformat=unix
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
