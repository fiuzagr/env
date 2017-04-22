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

" Tab is default
set noexpandtab

nnoremap <silent> <buffer> <leader>i :JavaImport<cr>
nnoremap <silent> <buffer> <leader>d :JavaDocSearch -x declarations<cr>
nnoremap <silent> <buffer> <cr> :JavaSearchContext<cr>

set background=dark
colorscheme PaperColor
hi ColorColumn ctermbg=gray ctermfg=black guibg=#ffffff guifg=#000000
hi NonText ctermfg=8 guifg=gray
hi SpecialKey ctermfg=8 guifg=gray
