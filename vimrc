" ~/.vimrc, ~/.virc, ~/.exrc,
" vim.org , vimhelp.org ,

" $ vi ~/.bashrc
" stty -ixon # terminal flow control Ctrl-s conflicts with vim, emacs
" #stty columns 80
" #stty rows 24
" $

" $ sudo vim -u ~/.vimrc a.txt

" multiple files in command line args
" $ vim a.txt b.txt
" :args , :n , :N , :rewind ,

" multiple buffers
" :e a.txt , :buffers , :buffer 3 , [3]Ctrl-^ , :bnext , :bprevious ,

" multiple tabs
" :tabnew [a.txt] , :tabedit [a.txt] ,
" gt , gT , [3]gt , :tabn [3] ,

" multiple windows
" C-W-H , C-W-L , C-W-J , C-W-K , C-W-S , C-W-V , :close ,
" :resize 3 , :resize +3 , :vertical resize 3 , :vertical resize +3 ,
" :echo winwidth(0) , :echo winheight(0) ,

" :w , :w! , :wa , :q, :q!, :qa , :wqa ,
" undo: u , redo: Ctrl-r , " set nocompatible

" search / ? n N * #
" case insensitive, /\cFOO , /\cfoo ,

" vim command-line window history, :Ctrl-f , :Ctrl-p , :Ctrl-n , / , n , N , * ,
" completion, Ctrl-p , Ctrl-n ,

" search for a letter c in a line, fc ,
" search forward ;
" search backword ,

" quickfix window
" :copen , :make
" :grep -r "foo" *
" :grep -r "foo" * --exclude "*.swp" --exclude "*.d" --exclude "*.o"

" g~w (toggle the case of the current word)
" g~$ (toggle the case of text from the cursor to the end of the line)


""" built-ins """

filetype on
" :messages " check for messages with echom
set autoindent
"set colorcolumn=80
set cursorline
set expandtab
set hlsearch
set incsearch
set mouse=a " selection: Win:shift+mouse, Mac:fn+mouse,
set nocompatible " vim-tiny, u always undo, Ctrl-r always redo,
set nowrapscan
set number
set ruler " vim-tiny, show current line number at status line
set shiftwidth=2
set tabstop=2
set updatetime=100 " CursorHold, tagbar,
"syntax off

" auto save works with vim, not vim-tiny
autocmd TextChanged,TextChangedI * if &modifiable && !&readonly && expand("%") != "" && &buftype == "" | silent write | endif

" highlight occurrences of word when cursor is inside the word,
" cancel highlight when cursor is outside.
"let old_isk = &iskeyword | set iskeyword=@,48-57,_,192-255 | autocmd CursorMoved,CursorMovedI * execute 'match Visual' (getline('.')[col('.')-1] =~# '\w' ? '/\<' . escape(expand('<cword>'), '/\.*$^~[]') . '\>/' : '//') | let &iskeyword = old_isk

" highlight selected text by search in visual mode(v), press * or # to search,
" search for any non-existing text to cancel the highlight.
"vnoremap <expr> * 'y:let @/ = @" <bar> normal! n<CR>'
"vnoremap <expr> # 'y:let @/ = @" <bar> normal! N<CR>'

" netrw
"autocmd VimEnter * Lexplore
nnoremap <F2> :Lexplore<CR>
let g:netrw_banner = 0
let g:netrw_browse_split = 4 " press t to open file in new tab,
let g:netrw_list_hide = '.*\.swp$'
let g:netrw_liststyle = 3
let g:netrw_winsize = 20 " percentage of the window size
let g:netrw_mousemaps = 0

" Termdebug
"packadd! termdebug
"nnoremap <F5> :Termdebug<CR>
"tnoremap <F10> <C-w>:call TermDebugSendCommand('next')<CR>
"tnoremap <F11> <C-w>:call TermDebugSendCommand('step')<CR>
"tnoremap <F12> <C-w>:call TermDebugSendCommand('finish')<CR>


""" non built-in plugins """

" vim-lsp, vim-lsp-settings
" install for vim at "opt" directory and manually packadd,
" neovim built-in lsp: tagfunc is set to vim.lsp.tagfunc(),
if !has('nvim') && filereadable(expand('~/.vim/pack/*/*/vim-lsp/plugin/lsp.vim'))
  packadd! vim-lsp
  packadd! vim-lsp-settings
  set tagfunc=lsp#tagfunc

  " auto format on save by :w ,
  autocmd BufWritePre * if exists(':LspDocumentFormat') | execute ':LspDocumentFormat' | endif
endif

" Tagbar
" https://github.com/preservim/tagbar/issues/851 ,
if !has('nvim') && filereadable(expand('~/.vim/pack/*/*/tagbar/plugin/tagbar.vim'))
  packadd! tagbar
  autocmd QuitPre * qall
  let g:tagbar_sort = 0
  let g:tagbar_compact = 1
  nnoremap <F3> :TagbarToggle<CR>
endif

" gutentags
" ctags: Ctrl-], Ctrl-t, Ctrl-o, Ctrl-i,
" $ mkdir ~/myproject_root_dir/.git
if !has('nvim') && filereadable(expand('~/.vim/pack/*/*/gutentags/plugin/gutentags.vim'))
  packadd! gutentags
  let g:gutentags_add_default_project_roots = 1
endif
