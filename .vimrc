filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
filetype plugin indent on

set nocompatible      " We're running Vim, not Vi!
set modelines=0

compiler ruby         " Enable compiler support for ruby

if has("gui_running")
  set guifont=Menlo:h11
endif
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif
if has('mouse')
  set mouse=a
endif

" encoding
set encoding=utf-8
set termencoding=utf-8
set fileencodings=ucs-bom,utf-8,default,latin1
" indent
set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab
set smartindent
set cindent
set copyindent
set backspace=indent,eol,start

" Command-T configuration
let g:CommandTMaxHeight=20

if has("autocmd")
  augroup vimrcEx
  au!
  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
  augroup END
else
  set autoindent    " always set autoindenting on
endif " has("autocmd")

" this should strip trailing whitespace on save
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd BufWritePre *.* :call <SID>StripTrailingWhitespaces()

set scrolloff=3
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set ruler
set laststatus=2
set relativenumber

" Keep swap/undo in an out of the way place.
set undofile
if has("vms")
  set nobackup    " do not keep a backup file, use versions instead
else
  set backup    " keep a backup file
endif
" Trail with trailing // then vim will automatically use the full path to the file. ',.' uses current directory if directory not created.
set undodir=~/.vimtmp//,.
set backupdir=~/.vimtmp//,.
set directory=~/.vimtmp//,.

" folding settings
set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

" search stuff
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %

" navigate splits
nmap <c-h> <c-w>h<c-w><bar>
nmap <c-l> <c-w>l<c-w><bar>
nmap <c-j> <C-w>j<C-w><bar>
nmap <c-k> <C-w>k<C-w><bar>

" long lines
set wrap
set textwidth=79
set formatoptions=qrn1
set guioptions-=L
set guioptions-=r
set guioptions-=T

" textmate-like invisible characters
set list
set listchars=tab:▸\ ,eol:¬

augroup myfiletypes
  " Clear old autocmds in group
  autocmd!
  " treat rackup files like ruby
  au BufRead,BufNewFile *.ru set ft=ruby
  au BufRead,BufNewFile Gemfile set ft=ruby
  autocmd BufEnter *.haml setlocal cursorcolumn
  au BufRead,BufNewFile Capfile set ft=ruby
  au BufRead,BufNewFile Rakefile set ft=ruby
  au BufRead,BufNewFile *.jss set ft=css
  au BufRead,BufNewFile *.less set ft=css
augroup END

" my leader:
let mapleader = ","

" NERDTree
let NERDChristmasTree = 1
let NERDTreeWinPos = "left"
let NERDTreeShowFiles = 1
let NERDTreeChDirMode = 2
let NERDTreeQuitOnOpen = 0
let NERDTreeShowHidden = 1
let NERDTreeShowLineNumbers = 0
map <leader>n :NERDTreeToggle<cr>

" Commenting {{{2
" requires NERDCommenter plugin
vmap <D-/> ,c<space>gv
map <D-/> ,c<space>

" Ack
map <leader>f :Ack

" colorscheme Sunburst
colorscheme vividchalk

" Easily modify vimrc {{{1
nmap <leader>v :e $MYVIMRC<CR>
if has("autocmd")
  augroup myvimrchooks
    au!
    autocmd bufwritepost .vimrc source ~/.vimrc
  augroup END
endif

" map jj to escape to get out of insert mode
inoremap jj <ESC>
" save pressing shift...
nnoremap ; :
" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e
" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv
" Visually select the text that was last edited/pasted
nmap gV `[v`]
" textmate's indent
nmap <D-[> <<
nmap <D-]> >>
vmap <D-[> <gv
vmap <D-]> >gv
" quickly cycle windows
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
" Press Space to turn off highlighting and clear any message already displayed.
:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

"if exists(":Tabularize")
  nmap <leader>a= :Tabularize /=<CR>
  vmap <leader>a= :Tabularize /=<CR>
  nmap <leader>a: :Tabularize /:\zs<CR>
  vmap <leader>a: :Tabularize /:\zs<CR>
"endif

" Set tabstop, softtabstop and shiftwidth to the same value {{{2
" From http://vimcasts.org/episodes/tabs-and-spaces/
command! -nargs=* Stab call Stab()
function! Stab()
  let l:tabstop = 1 * input('set tabstop = softtabstop = shiftwidth = ')
  if l:tabstop > 0
    let &l:sts = l:tabstop
    let &l:ts = l:tabstop
    let &l:sw = l:tabstop
  endif
  call SummarizeTabs()
endfunction
function! SummarizeTabs()
  try
    echohl ModeMsg
    echon 'tabstop='.&l:ts
    echon ' shiftwidth='.&l:sw
    echon ' softtabstop='.&l:sts
    if &l:et
      echon ' expandtab'
    else
      echon ' noexpandtab'
    endif
  finally
    echohl None
  endtry
endfunction

