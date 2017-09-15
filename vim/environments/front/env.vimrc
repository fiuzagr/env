""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""
" FRONT-END Environment
""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""
autocmd VimEnter * echohl Error | echom 'Front-end Environment Loaded' | echohl None

" Disable eclim
let g:EclimDisabled = 1

" Neoformat
let g:neoformat_try_formatprg = 1
autocmd BufWritePre *.js Neoformat
autocmd BufWritePre *.jsx Neoformat

" Formatters
autocmd FileType javascript set formatprg=prettier-standard
