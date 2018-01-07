"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer:
"       Amir Salihefendic
"       http://amix.dk - amix@amix.dk
"
" Version:
"       5.0 - 29/05/12 15:43:36
"
" Blog_post:
"       http://amix.dk/blog/post/19691#The-ultimate-Vim-configuration-on-Github
"
" Awesome_version:
"       Get this config, nice color schemes and lots of plugins!
"
"       Install the awesome version from:
"
"           https://github.com/amix/vimrc
"
" Syntax_highlighted:
"       http://amix.dk/vim/vimrc.html
"
" Raw_version:
"       http://amix.dk/vim/vimrc.txt
"
" Sections:
"    -> General
"    -> VIM user interface
"    -> Colors and Fonts
"    -> Files and backups
"    -> Text, tab and indent related
"    -> Visual mode related
"    -> Moving around, tabs and buffers
"    -> Status line
"    -> Editing mappings
"    -> vimgrep searching and cope displaying
"    -> Spell checking
"    -> Misc
"    -> Helper functions
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" My runtime
if !exists('g:vimCustomPath')
  let g:vimCustomPath = $MY_ENV . '/vim'
endif
let &runtimepath .= ',' . g:vimCustomPath . '/plugins/myenv'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=700

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

" Fast editing
nmap <leader>e<space> :e<cr>
nmap <leader>ev :e ~/.vimrc<cr>
nmap <leader>ez :e ~/.zshrc<cr>
nmap <leader>et :e ~/.tmux.conf<cr>
" Fast source rc
nmap <leader>sv :so ~/.vimrc<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore+=**/node_modules/**,**/.git/**

"Always show current position
set ruler

" Height of the command bar
set cmdheight=2
set shortmess=a

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=indent,eol,start
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Line numbers
set relativenumber 
set number 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable

"colorscheme wombat256mod
set background=dark


" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions+=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" Set utf8 as standard encoding and en_US as the standard language
scriptencoding utf-8
set encoding=utf-8
set fileencoding=utf-8

" Use Unix as the standard file type
set ffs=unix,dos,mac

"highlight column 80
"let &colorcolumn=join(range(81,999),",")
"let &colorcolumn="80,".join(range(120,999),",")
let &colorcolumn="80"
" use after coloscheme
"hi ColorColumn ctermbg=white ctermfg=black guibg=#ffffff guifg=#000000

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

au BufRead,BufNewFile *.shtm set filetype=html
au BufRead,BufNewFile *.shtml set filetype=html

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 2 spaces
set shiftwidth=2
set tabstop=2

" Linebreak on 120 characters
set lbr
"set tw=120
"set wm=0
"set fo=cqt

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" Show invisibles
set list
set list listchars=tab:\|\ ,trail:.,precedes:<,extends:>,eol:$
nmap <leader>l :set list!<cr>

" Git Commit ON 72 chars
autocmd Filetype gitcommit setlocal spell textwidth=72

""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <c-space> ?

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Useful mappings for managing  buffer
map <leader>bd :Bdelete<cr>
map <leader>ba :bufdo Bdelete!<cr>
map <leader>bw :bufdo w<cr>
map <leader>bn :bn<cr>
map <leader>bp :bp<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%

" Maximize and minimize panes
map <C-W><UP> <C-W>\|<C-W>_
map <C-W><DOWN> <C-W>=

""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" copy with xclip
map <F6> :w !xclip -sel clip<CR><CR>
vmap <F6> :!xclip -f -sel clip<CR>
map <F7> :-1r !xclip -o -sel clip<CR>

" Remap VIM 0 to first non-blank character
map 0 ^

" Use Q for formatting the current paragraph (or selection)
vmap Q gq
nmap Q gqap

" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()
autocmd BufWrite *.js :call DeleteTrailingWS()
autocmd BufWrite *.jsx :call DeleteTrailingWS()
autocmd BufWrite *.php :call DeleteTrailingWS()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vimgrep searching and cope displaying
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" When you press gv you vimgrep after the selected text
vnoremap <silent> gv :call VisualSelection('gv')<CR>

" Open vimgrep and put the cursor in the right position
map <leader>g :vimgrep // **/*.<left><left><left><left><left><left><left>

" Vimgreps in the current file
map <leader><space> :vimgrep // <C-R>%<C-A><right><right><right><right><right><right><right><right><right>

" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace')<CR>

" Do :help cope if you are unsure what cope is. It's super useful!
"
" When you search with vimgrep, display your results in cope by doing:
"   <leader>cc
"
" To go to the next search result do:
"   <leader>n
"
" To go to the previous search results do:
"   <leader>p
"
map <leader>cc :botright cope<cr>
map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
map <leader>n :cn<cr>
map <leader>p :cp<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Quickly open a buffer for scripbble
map <leader>q :e ~/buffer<cr>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>
set pastetoggle=<F2>



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

function! VisualSelection(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction


" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

" Grep todos
command! FindTodo noautocmd grep /TODO\|FIXME\|BUG/ij ** | cw
map <leader>t<space> :FindTodo<CR>

" Avoid hit-enter
command! -nargs=1 Silent execute 'silent !' . <q-args> 
" | execute 'redraw!'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin()
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sensible
Plug 'tpope/vim-sensible'

" RSI
Plug 'tpope/vim-rsi'

" Vim colors
Plug 'flazz/vim-colorschemes'
" Plug 'Valloric/vim-valloric-colorscheme'
Plug 'nanotech/jellybeans.vim'
Plug 'monkoose/boa.vim'

" Devicons
Plug 'ryanoasis/vim-devicons'

" Vim diff
Plug 'chrisbra/vim-diff-enhanced'

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_theme='badwolf'
let g:airline_powerline_fonts = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#right_sep = ' '
let g:airline#extensions#tabline#right_alt_sep = '|'
let g:airline#extensions#tmuxline#enabled = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_symbols = {}
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace = 'Ξ'

" Tmux line
Plug 'edkolev/tmuxline.vim'
let g:tmuxline_powerline_separators = 0

" CtrlP
Plug 'ctrlpvim/ctrlp.vim'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = '\v[\/](\.git|node_modules)$'

" nerdtree
Plug 'scrooloose/nerdtree'
" nerdtree tabs
Plug 'jistr/vim-nerdtree-tabs'
map <C-e> :NERDTreeTabsToggle<CR>
map <leader>e :NERDTreeFind<CR>
nmap <leader>nt :NERDTreeFind<CR>
let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=1
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1
let g:nerdtree_tabs_open_on_gui_startup=0

" nerdcommenter
Plug 'scrooloose/nerdcommenter'
map <leader>c<space> :NERDComToggleComment<cr>
map <leader><leader>c<space> :NERDComToggleComment<cr>
let g:NERDSpaceDelims=1
let g:NERDCustomDelimiters = { 'ejs': { 'left': '<%/*','right': '*/%>' } }

" numbers.vim
Plug 'myusuf3/numbers.vim'

" Tabular.vim
Plug 'godlygeek/tabular'

" vim-markdown
Plug 'tpope/vim-markdown'

" Vim preview (.md, .html)
" <leader>P
Plug 'spf13/vim-preview'

" Vim Blade template
Plug 'xsbeats/vim-blade'

" Vim Jade template
Plug 'digitaltoad/vim-pug'

" Vim Less CSS
Plug 'groenewege/vim-less'

" Vim Stylus CSS
Plug 'wavded/vim-stylus'

" Vim Javascript syntax highlight
Plug 'pangloss/vim-javascript'

" Vim GraphQL
Plug 'jparise/vim-graphql'

" Vim Flow JS
Plug 'flowtype/vim-flow'
let g:flow#enable = 0

" Vim EJS
Plug 'nikvdp/ejs-syntax'

" Vim Angular
Plug 'burnettk/vim-angular'

" Vim JSBeautify
" Plug 'maksimr/vim-jsbeautify'
".vimrc
"map <c-f> :call JsBeautify()<cr>
" or
" autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
" for json
" autocmd FileType json noremap <buffer> <c-f> :call JsonBeautify()<cr>
" for jsx
" autocmd FileType jsx noremap <buffer> <c-f> :call JsxBeautify()<cr>
" for html
" autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
" autocmd FileType ejs noremap <buffer> <c-f> :call HtmlBeautify()<cr>
" for css or scss
" autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>

" Vim TypeScript syntax
Plug 'leafgarland/typescript-vim'

" Vim JSX syntax highlight
Plug 'mxw/vim-jsx'

" Vim JSON
Plug 'elzr/vim-json'

" Vim Editor Config
Plug 'editorconfig/editorconfig-vim'

" Multiple Cursor mode
Plug 'terryma/vim-multiple-cursors'
" Prevent conflict with neocomplete
" Called once right before you start selecting multiple cursors
function! Multiple_cursors_before()
  if exists(':NeoCompleteLock')==2
    exe 'NeoCompleteLock'
  endif
endfunction
" Called once only when the multiple selection is canceled (default <Esc>)
function! Multiple_cursors_after()
  if exists(':NeoCompleteUnlock')==2
    exe 'NeoCompleteUnlock'
  endif
endfunction


" Increment numbers
Plug 'triglav/vim-visual-increment'
set nrformats=alpha

" Tmux Conf
Plug 'tmux-plugins/vim-tmux'

" Vim todo
Plug 'dhruvasagar/vim-dotoo'

" Vim images
Plug 'ashisha/image.vim'

" Easy Motion
Plug 'easymotion/vim-easymotion'

" Minimap
Plug 'severin-lemaignan/vim-minimap'

" Surround
Plug 'tpope/vim-surround'

" Vim buffer bye
Plug 'moll/vim-bbye'

" Vim CSS Color
Plug 'ap/vim-css-color'

" Vim Dash.app
Plug 'rizzatti/dash.vim'
nmap <silent> <leader>d <Plug>DashSearch

" Indent Guides
Plug 'nathanaelkane/vim-indent-guides'
let g:indent_guides_enable_on_vim_startup = 1
"let g:indent_guides_guide_size = 1

" Git Gutter
Plug 'airblade/vim-gitgutter'

" Neoformat
Plug 'sbdchd/neoformat'

" Asynchronous Lint Engine
Plug 'w0rp/ale'
let g:ale_fixers = {'javascript': ['prettier', 'eslint']}
" let g:ale_linters = {'javascript': ['']}
let g:ale_fix_on_save = 1

" Load env plugins
call myenv#load#plug()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#end() " END Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Work only after call plug#end
colo jellybeans
hi ColorColumn ctermbg=gray ctermfg=black guibg=#ffffff guifg=#000000
hi NonText ctermfg=8 guifg=gray
hi SpecialKey ctermfg=8 guifg=gray

" Load env rc
call myenv#load#env()

