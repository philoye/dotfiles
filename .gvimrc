let g:indent_guides_auto_colors = 1

" GVIM
"-------------------------------------------------
if has("gui_gtk")
  source $HOME/.vim/gui_gtk.vim
end

" MACVIM
"-------------------------------------------------
if has("gui_macvim")
  source $HOME/.vim/gui_macvim.vim
  colorscheme solarized
endif

" VIMENTER
"-------------------------------------------------
" if isdirectory(argv(0))
"   au VimEnter * :NERDTreeToggle
"   au VimEnter * :wincmd p
" endif

" Colour columns
" hi ColorColumn guibg=#222222

" ???
set go-=T

