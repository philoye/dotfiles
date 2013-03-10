" FILETYPES
"-------------------------------------------------
autocmd FileType ruby,rails,haml,eruby,yaml,ru,cucumber set ai sw=2 sts=2 et
if has("gui_running")
  autocmd FileType ruby,rails,haml,eruby,yaml,ru,cucumber :SyntasticEnable
endif

" FILE TYPES
"-------------------------------------------------
au BufRead,BufNewFile {Gemfile,Rakefile,Capfile,Guardfile*.rake,config.ru}   set ft=ruby
au BufRead,BufNewFile {*.md,*.mkd,*.markdown}                                set ft=markdown wrap
au BufRead,BufNewFile {*.haml,*.hamlc}                                       set ft=haml
au BufRead,BufNewFile {*.scss,*.less}                                        set ft=css
au BufRead,BufNewFile {COMMIT_EDITMSG}                                       set ft=gitcommit
au BufRead,BufNewFile {*.vim}                                                set ft=vim

" AUTO RE-SOURCE VIMRC
"-------------------------------------------------
" fun! SourceConfig()
  " source $MYVIMRC
  " if has("gui_running")
    " source $MYGVIMRC
    " doautocmd ColorScheme .vimrc
 " endif
" endfun
" autocmd BufWritePost *.vim   :call SourceConfig()
" autocmd BufWritePost .vimrc  :call SourceConfig()

" STRIP WHITESPACE ON SAVE
"-------------------------------------------------
fun! <SID>StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfun
autocmd BufWritePre *.* :call <SID>StripTrailingWhitespaces()

" GO TO LAST KNOWN CURSOR POSITION
"-------------------------------------------------
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
" Don't do it when the mark is in the first line, default when opening a file
autocmd BufReadPost *
  \ if line("'\"") > 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif
augroup END

" Set color column for features
" autocmd BufWinEnter *.feature set cc+=11
" autocmd BufWinLeave *.feature set cc-=11

