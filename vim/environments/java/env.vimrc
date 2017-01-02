""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""
" JAVA Environment
""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""
autocmd VimEnter * echohl Error | echom 'Java Environment Loaded' | echohl None

" Enable eclim
if exists('g:EclimDisabled')
  unlet g:EclimDisabled
endif

