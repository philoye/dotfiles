" MISC
"-------------------------------------------------
syntax on                                  " Turn on syntax highlighting
filetype plugin indent on                  " Enable automatic filetype detection, filetype-specific plugins/indentation
set hidden                                 " Allow hiding buffers with unsaved changes
set list                                   " Show invisibles by default
set listchars=tab:▸\ ,eol:¬                " Change the invisible characters
set showcmd                                " Show incomplete cmds down the bottom
set showmode                               " Show current mode down the bottom
set cmdheight=2                            " Make the command line a little taller
set ttyfast                                " More smooth screen redrawing
set ruler                                  " Show ruler
set number                                 " Show line numbers
set relativenumber                         " Line numbers should be relative to current line
set vb t_vb=                               " Turn off bell
set mouse=a                                " Enable the mouse
set linespace=3                            " Spacing between lines
set t_Co=256                               " Support for xterm with 256 colors (gets overriden in .gvimrc)
set cursorline                             " Highlight the current line
set gcr=n:blinkon0                         " Turn off blinking cursor

" INDENTATION
"-------------------------------------------------
set shiftwidth=2                           " Number of spaces to use in each autoindent step
set tabstop=2                              " Two tab spaces
set softtabstop=2                          " Number of spaces to skip or insert when <BS>ing or <Tab>ing
set expandtab                              " Spaces instead of tabs for better cross-editor compatibility
set autoindent                             " Keep the indent when creating a new line
set smarttab                               " Use shiftwidth and softtabstop to insert or delete (on <BS>) blanks
set cindent                                " Recommended setting for automatic C-style indentation
set autoindent                             " Automatic indentation in non-C files
set copyindent                             " Copy the structure of the existing lines indent when autoindenting a new line.
" set smartindent
" set backspace=indent,eol,start
"

" WRAP
"-------------------------------------------------
set nowrap                                 " Dont wrap lines
set wildmenu                               " Make tab completion act more like bash
set wildmode=list:longest                  " Tab complete to longest common string, like bash
set switchbuf=useopen                      " Don't re-open already opened buffers

" MOVING AROUND / EDITING
"-------------------------------------------------
set nostartofline                          " Avoid moving cursor to BOL when jumping around
set scrolloff=3                            " Keep 3 context lines above and below the cursor
set backspace=2                            " Allow backspacing over autoindent, EOL, and BOL
set showmatch                              " Briefly jump to a paren once it's balanced
set matchtime=2                            " (for only .2 seconds).

" BACKUPS
"-------------------------------------------------
set nobackup                               " Kill backups
set noswapfile                             " Disable creation of *.swp files
set backupskip=/tmp/*,/private/tmp/*       "allows you to edit files in place, useful for crontab -e
"set nowritebackup

" PERSISTENT UNDO
"-------------------------------------------------
"set undodir=$HOME/.vim/undodir
set undofile
set undolevels=1000
set undoreload=10000

" CODE FOLDING
"-------------------------------------------------
set foldmethod=indent                      " Automatically fold based on syntax
set foldlevelstart=99                      " Expand all folds by default
set nofoldenable                           " Dont fold by default

" SEARCHING
"-------------------------------------------------
set incsearch                              " Find the next match as we type the search
set hlsearch                               " Highlight searches by default
set ignorecase                             " Ignore case by default when searching
set smartcase                              " Switch to case sensitive mode if needle contains uppercase characters
" set gdefault
" set showmatch

" DEFAULT COLOURS/FONTS FOR VIM - GVIMRC OVERRIDES THIS
"-------------------------------------------------
set background=dark
colorscheme desert
hi StatusLine guifg=#CD5907 guibg=#ffffff
if has("gui_running")
  set guifont=Menlo:h11
endif

" CUSTOM STATUS LINE
"-------------------------------------------------
set laststatus=2
set statusline=%F%m%r%h%w\ [TYPE=%Y]\ \ \ \ \ \ [POS=%2l,%2v][%p%%]\ \ \ \ \ \ [LEN=%L]

" HELP
"-------------------------------------------------
au BufWinEnter *.txt if &ft == 'help' | wincmd L | endif

" LOSE FOCUS
"-------------------------------------------------
au FocusLost * :silent! wall                            " Save when window loses focus
au FocusLost,TabLeave * call feedkeys("\<C-\>\<C-n>")   " Exit insert mode when you lose focus


" ignore cruft on OSX/Linux
set wildignore+=*/tmp/*,*.so,*.swp,*.zip

" Use % to jump to matching begin/end of blocks as well as brackets/parens
runtime macros/matchit.vim

