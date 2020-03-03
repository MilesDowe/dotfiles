" Lightline preferences

" Add GitGutter info
function! GitStatus()
	let [a,m,r] = GitGutterGetHunkSummary()
	return printf('+%d ~%d -%d', a, m, r)
endfunction

let g:lightline =  {
\ 'colorscheme': 'one',
\   'active': {
\   	'left': [['mode', 'paste'], ['readonly', 'gitgut', 'filename', 'modified']]
\   },
\   'component_function': {
\   	'gitgut': 'GitStatus'
\   },
\}
set noshowmode " get rid of `--INSERT--` since lightline shows it
