" Prose, notetaking mode

function! ProseTimeOn()
    Limelight
    set filetype=markdown
    PencilSoft
endfunction
command! ProseOn call ProseTimeOn()


function! ProseTimeOff()
    Limelight!
    PencilOff
endfunction
command! ProseOff call ProseTimeOff()

