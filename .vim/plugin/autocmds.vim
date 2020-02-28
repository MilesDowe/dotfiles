augroup gofiles
	autocmd!
	" run formatter before opening
	autocmd BufRead *.go :%!gofmt
augroup end

augroup pythonfiles
	autocmd!
	autocmd BufRead,BufNewFile *.py set expandtab " use spaces
	autocmd BufRead,BufNewFile *.py set tabstop=4
	autocmd BufRead,BufNewFile *.py set softtabstop=4
	autocmd BufRead,BufNewFile *.py set shiftwidth=0
augroup end

