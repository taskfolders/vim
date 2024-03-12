" jump_to_file.vim

""""""""""""""""""""""
"

function! JumpToFile()
  let query = expand("<cword>")
  let db = expand("~") . '/.config/TaskFolders.com/db.json'
  let doc = readfile(db)
  let data = json_decode(doc)

  let uid = query

  if has_key(data['sids'], uid)
    let uid = data['sids'][uid]
  endif


  if has_key(data['uids'], uid)
    let file_path = data['uids'][uid]['path']
    echo "Found target file " . file_path
    "echo "Query: " + query

    " Check if the file exists
    if filereadable(file_path)
      " Open the file
      execute "edit " . file_path
    else
      echo "File not found: " . file_path
    endif

  else
    echo "Identifier '" . uid . "' not found in the TaskFolders index"
  endif

  return

  " TODO relative [dir] links in wikilink ?
  " let file_path = expand("%:p:h") . "/" . keyword . ".md"

  " Check if the file exists
  if filereadable(file_path)
    " Open the file
    execute "edit " . file_path
  else
    echo "File not found: " . file_path
  endif
endfunction

""""""""""""""""""""""
" 
nnoremap <Leader>j :call JumpToFile()<CR>
nnoremap <Leader>f :call JumpToFile()<CR>


