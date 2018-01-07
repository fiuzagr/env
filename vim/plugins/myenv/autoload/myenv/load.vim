"
" TODO refactor
"
function! s:getenvfile (filetype) 
  let l:currentDirectory = fnameescape(getcwd())
  let l:vimEnvFilename = '.vim_environment'
  let l:environmentsPath = g:vimCustomPath . '/environments/'
  let l:envRc = l:environmentsPath . 'front/' . a:filetype . '.vimrc' " default

  let found = fnameescape(findfile(l:vimEnvFilename, l:currentDirectory . ';' . $HOME))

  if filereadable(found)
    let l:environment = readfile(found)[0]
    let l:envRc = l:environmentsPath . l:environment . '/' . a:filetype . '.vimrc'
  endif

  return fnameescape(l:envRc)
endfunction

" Load env file
function! myenv#load#env ()
  let l:envRc = s:getenvfile('env')

  if filereadable(l:envRc)
    execute 'source ' . l:envRc
  endif
endfunction

" Load plug file
function! myenv#load#plug ()
  let l:envRc = s:getenvfile('plug')

  if filereadable(l:envRc)
    execute 'source ' . l:envRc
  endif
endfunction
