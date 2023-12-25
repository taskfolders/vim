" jump_to_file.vim

""""""""""""""""""""""
"

function! JumpToFile()
  " Get the word under the cursor
  let keyword = expand("<cword>")

  " Construct the file path based on the keyword
  " let file_path = expand("%:p:h") . "/" . keyword
  let file_path = expand("%:p:h") . "/" . keyword . ".md"

  " Check if the file exists
  if filereadable(file_path)
    " Open the file
    execute "edit " . file_path
  else
    echo "File not found: " . file_path
  endif
endfunction

" Map a key to trigger the JumpToFile function
" TODO silent jump + print found message?
" nnoremap <Leader>j :silent call JumpToFile()<CR>
nnoremap <Leader>j :call JumpToFile()<CR>

""""""""""""""""""""""
" 

function! ReadJsonFile(file_path)
  " Read the content of the JSON file
  let json_content = readfile(a:file_path)

  " Parse JSON content using Vim's json_decode function
  let parsed_json = json_decode(join(json_content, "\n"))

  " Print the parsed JSON
  echo parsed_json

    " Extract the value of the specified key
  let key_value = get(parsed_json, 'foo', 'Key not found')

  " Print the value of the key
  echo key_value

endfunction

command! -nargs=1 ReadJsonFile :call ReadJsonFile(<f-args>)

