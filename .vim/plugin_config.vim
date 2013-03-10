" NERDTree
"-------------------------------------------------
let g:NERDTreeHijackNetrw     = 0
let g:loaded_netrw            = 1        " Disable netrw
let g:loaded_netrwPlugin      = 1        " Disable netrw
let g:NERDTreeMinimalUI       = 1
let g:NERDTreeDirArrows       = 1
let g:NERDTreeWinSize         = 41
let g:NERDTreeWinPos          = 'left'
let NERDTreeShowHidden        = 1
let NERDTreeShowFiles         = 1
let NERDTreeQuitOnOpen        = 0


" NERD-TREE-TABS
"-------------------------------------------------
let g:nerdtree_tabs_open_on_gui_startup = 1    " Auto open nerd tree on startup

" SYNTASTIC
"-------------------------------------------------
let g:syntastic_enable_signs  = 1
let g:syntastic_auto_loc_list = 0
if !has("gui")
 let g:loaded_syntastic_plugin = 0
endif

" INDENT GUIDES
"-------------------------------------------------
let g:indent_guides_auto_colors = 0
let g:indent_guides_color_change_percent = 3
let g:indent_guides_enable_on_vim_startup = 1

" NERD-COMMENTER
"-------------------------------------------------
let g:NERDSpaceDelims=1

" CONTROL-P
"-------------------------------------------------
let g:ctrlp_clear_cache_on_exit   = 1
let g:ctrlp_working_path_mode     = 0 " Handle working path manually
let g:ctrlp_dotfiles              = 0 " Ignore all dot/hidden files
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_custom_ignore         = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$\|\backups$\|\logs$\|\tmp$',
  \ 'file': '',
  \ 'link': '',
  \ }
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files --exclude-standard']

