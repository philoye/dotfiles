filetype off 
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

set nocompatible      " We're running Vim, not Vi!

" Security
set modelines=0

filetype plugin indent on

syntax on             " Enable syntax highlighting
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins
compiler ruby         " Enable compiler support for ruby

if has("gui_running")
  set guifont=Menlo:h11
endif

set mouse=a
set background=dark
set ruler

" encoding
set termencoding=utf-8
set fileencodings=ucs-bom,utf-8,default,latin1

" indent
set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab
set autoindent
set smartindent
set cindent
set copyindent
set backspace=indent,eol,start

set encoding=utf-8
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
" If you end your settings with double trailing // then vim will automatically use the full path to the file
set undofile
set backupdir=~/.vim/backup//
set directory=~/.vim/swp//

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

" long lines
set wrap
set textwidth=79
set formatoptions=qrn1
" set colorcolumn=85

" textmate-like invisible characters
set list
set listchars=tab:▸\ ,eol:¬

" turn off arrow key support...
" nnoremap <up> <nop>
" nnoremap <down> <nop>
" nnoremap <left> <nop>
" nnoremap <right> <nop>
" inoremap <up> <nop>
" inoremap <down> <nop>
" inoremap <left> <nop>
" inoremap <right> <nop>
" nnoremap j gj
" nnoremap k gk

" my leader:
let mapleader = ","
" map jj to escape to get out of insert mode
inoremap jj <ESC>
" save pressing shift...
nnoremap ; :

" NERDTree
let NERDChristmasTree = 1
let NERDTreeWinPos = "left"
let NERDTreeShowFiles = 1
let NERDTreeShowHidden = 1
let NERDTreeChDirMode = 2
map <leader>n :NERDTreeToggle<cr>

" Ack
map <leader>a :Ack 

" colorscheme Sunburst
colorscheme vividchalk

