" Lightline preferences

" Add GitGutter info
function! GitStatus()
	let [a,m,r] = GitGutterGetHunkSummary()
	return printf('+%d ~%d -%d', a, m, r)
endfunction

let g:lightline =  {
\ 'colorscheme': 'challenger_deep',
\ 'active': {
\   'left': [['mode', 'paste'], ['readonly', 'gitgut', 'filename', 'gitbranch', 'modified']],
\   'right': [ [ 'lineinfo' ], [ 'percent' ], [ 'fileformat', 'fileencoding', 'filetype', 'charvaluehex' ] ]
\ },
\ 'component_function': {
\   'gitgut': 'GitStatus',
\   'gitbranch': 'gitbranch#name',
\ },
\ 'component': {
\ 	'charhex': '0x%B',
\ },
\}
set noshowmode " get rid of `--INSERT--` since lightline shows it
