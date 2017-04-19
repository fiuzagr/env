""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""
" FRONT-END Environment
""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""
autocmd VimEnter * echohl Error | echom 'Front-end Environment Loaded' | echohl None

" Disable eclim
let g:EclimDisabled = 1

" Autofix entire buffer with eslint_d:
" if exists("b:syntastic_javascript_eslint_exec")
  " execute "nnoremap <leader>f mF:%!" . b:syntastic_javascript_eslint_exec . " --stdin --fix-to-stdout<CR>`F"
  " " Autofix visual selection with eslint_d:
  " execute "vnoremap <leader>f :!" . b:syntastic_javascript_eslint_exec . "  --stdin --fix-to-stdout<CR>gv"
" endif

autocmd FileType javascript set formatprg=prettier-standard\ --stdin\ --parser\ flow\ --single-quote
autocmd BufWritePre *.js :normal gggqG
