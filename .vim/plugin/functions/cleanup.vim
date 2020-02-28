" Create a commands for cleaning up files

" XML assumes Py3 installed
function! CleanUpXml()
    set syntax=xml
    %!python3 -c "import xml.dom.minidom, sys; print(xml.dom.minidom.parse(sys.stdin).toprettyxml())"
    g/^[\t ]*$/d
endfunction
command! XMLFormat call CleanUpXml()


" JSON assumes Py3 installed
function! CleanUpJson()
    set syntax=json
    %!python3 -m json.tool
endfunction
command! JSONFormat call CleanUpJson()

