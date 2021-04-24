try
	let g:wiki_root = 'C:\Users\Miles\Documents\knowledge_base'
	let g:wiki_zotero_root = 'C:\Users\Miles\Zotero'
catch
	" We're in the unix shell, so try that
	let g:wiki_root = '/mnt/c/Users/Miles/Documents/knowledge_base'
	let g:wiki_zotero_root = '/mnt/c/Users/Miles/Zotero'
endtry
let g:wiki_filetypes = ['md']
let g:wiki_link_target_type = 'md'
