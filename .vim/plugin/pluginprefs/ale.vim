" ALE preferences

let g:ale_lint_on_text_changed = 'never'
"let g:ale_linters = {'text': ['write-good','vale','textlint','proselint','languagetool','alex','redpen']}
let g:ale_fixers = {
  \ '*': ['remove_trailing_lines', 'trim_whitespace'],
  \ 'go': ['gofmt', 'goimports'],
  \ 'javascript': ['prettier'],
  \ 'python': ['autopep8'],
\}

" python config
let g:ale_python_auto_pipenv = 0
let g:ale_python_pylint_options = '--load-plugins'

" kotlin config
let g:ale_kotlin_kotlinc_classpath = "C:\Users\Miles\scoop\apps\kotlin\current\lib"
let g:ale_kotlin_kotlinc_sourcepath = "C:\Users\Miles\scoop\apps\kotlin\current\bin"

" don't refresh with every change
let g:ale_lint_on_text_changed = 'never'

nnoremap <leader>x :ALEFix<cr>
nnoremap <F8> :ALENext<cr>
nnoremap <S-F8> :ALEPrevious<cr>
