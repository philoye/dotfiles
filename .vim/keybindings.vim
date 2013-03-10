" REMAP LEADER TO ','
"-------------------------------------------------
let mapleader = ","

" EASYMOTION
"-------------------------------------------------
let g:EasyMotion_leader_key = '<Leader>e'

" CTRLP
"-------------------------------------------------
let g:ctrlp_map = '<Leader>t'
map <Leader>l :CtrlPBuffer<CR>
map <Leader>m :CtrlPMRUFiles<CR>
map <Leader>T :CtrlPClearAllCaches<CR>:CtrlP<CR>

" SHOW NERDTREE WITH LINE NUMBERS FOR EASIER NAVIGATION
"-------------------------------------------------
map <leader>n :NERDTreeToggle<CR>
map <leader>N :NERDTreeFind<CR>

" BUFFER NAVIGATION
"-------------------------------------------------
map <leader>, <C-^>
map <leader>] :bnext<CR>
map <leader>[ :bprev<CR>
map <leader>ls :buffers<CR>

" QUICKLY OPEN/SOURCE (.vimrc/.gvimrc)
"-------------------------------------------------
nmap <leader>v :e $MYVIMRC<CR>
nmap <Leader>gg :e $HOME/.gvimrc<CR>
nmap <leader>sv :source $HOME/.vimrc<CR>
nmap <Leader>ss :source $HOME/.vimrc<Bar>:source $HOME/.gvimrc<CR>

" NERD COMMENTER
"-------------------------------------------------
vmap <D-/> ,c<space>gv
map <D-/> ,c<space>
imap <D-/> <esc>,c<space>

" TOGGLE SHOW INVISIBLES
"-------------------------------------------------
noremap <leader>i :set list!<CR>

" MOVEMENT & WRAPPED LONG LINES
" This solves the problem that pressing down jumps your cursor 'over' the current line to the next line
"-------------------------------------------------
nnoremap j gj
nnoremap k gk

" REMOVE ANNOYING F1 HELP
"-------------------------------------------------
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" RESELECT VISUAL BLOCK AFTER IN/OUTDENT
"-------------------------------------------------
vnoremap < <gv
vnoremap > >gv

" EASY WINDOW NAVIGATION
"-------------------------------------------------
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" TABULARIZE
"-------------------------------------------------
nmap <leader>a= :Tabularize /=<CR>
vmap <leader>a= :Tabularize /=<CR>
" nmap <Leader>a: :Tabularize /:\zs<CR>
" vmap <Leader>a: :Tabularize /:\zs<CR>
nmap <Leader>a: :Tabularize /:\zs/l0l1<CR>
vmap <Leader>a: :Tabularize /:\zs/l0l1<CR>
nmap <leader>a> :Tabularize /=><CR>
vmap <leader>a> :Tabularize /=><CR>

" TEXTMATE INENTING
"-------------------------------------------------
nmap <D-[> <<
nmap <D-]> >>
vmap <D-[> <gv
vmap <D-]> >gv

" ACK
"-------------------------------------------------
nmap <Leader>f :Ack!<Space>
nmap <Leader>F :AckFromSearch!<CR>
nnoremap <Leader>H *<C-O>:AckFromSearch!<CR>     " Ack for word at cursor without changing position

" MISC SHORTCUTS
"-------------------------------------------------
" Save pressing shift...
nnoremap ; :
" map jj to escape to get out of insert mode
inoremap jj <ESC>

" Visually select the text that was last edited/pasted
nmap gV `[v`]

" Highlight word at cursor without changing position
nnoremap <Leader>h *<C-O>
"
" Align selected Cucumber table with <Bar>
" vmap <silent><Bar> :Align <Bar><CR>gv:S/\s\+$//e<CR>gv:S/^\s//e<CR>gv<Esc>

" Convert between spaces and tabs
map <Leader>I :set list<CR>:FixWhitespace<CR>

" Press Space to turn off highlighting and clear any message already displayed.
nnoremap<silent> <Space> :nohlsearch<Bar>:echo<CR>

" Toggle word wrap
map <Leader>W :set wrap!<CR>

" Toggle spell checking
map <Leader>S :set spell!<CR>

" Cycle between windows with Tab and Shift-Tab
map <silent><Tab> :wincmd w<CR>
map <silent><S-Tab> :wincmd W<CR>

" Quick-quit quickfix window
nmap <silent><Leader>q :cclose<CR>

" Copy relative path to the system pasteboard
nnoremap <silent><Leader>cf :let @*=expand('%')<CR>

" Copy relative path and line number to the system pasteboard
nnoremap <silent><Leader>cF :let @*=expand('%').':'.line('.')<CR>

" Disable going to Ex mode
map Q <ESC>

