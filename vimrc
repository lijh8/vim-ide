" ~/.vimrc, ~/.virc, ~/.exrc,

" $ vi ~/.bashrc
" stty -ixon  # terminal flow control Ctrl-s conflicts with vim, emacs.
" #stty columns 80
" $

" $ sudo vim -u ~/.vimrc /etc/systemd/system.conf

" undo: u, redo: Ctrl-r ,
" completion: Ctrl-p, Ctrl-n ,
" search:  /  ?  n  N  *  #

" switch with filename shortcuts, does not work for more than two files,
" :e a.txt, :w, :qa, :close, Ctrl-^ ,

" multiple buffer(s),
" $ vim a.txt b.txt
" :args, :n, :N, :rewind,

" multiple tab(s),
" :tabnew [a.txt] , :tabedit [a.txt] ,
" gt , gT , [3]gt , :tabn [3] ,

" multiple window,
" C-W-H, C-W-L, C-W-J, C-W-K, C-W-S, C-W-V,
" :resize 3 , :resize +3 , :vertical resize 3 , :vertical resize +3 ,

" search a single letter inside a line,
" search a letter f
" search forward ;
" search backword ,

" vim command-line window, search for vim command history,
" :Ctrl-f , :Ctrl-p , :Ctrl-n , / , n , N , * , # ,

" quickfix window,
" :copen
" :make
" :grep -r "foo" *
" :grep -r "foo" * --exclude "*.swp" --exclude "*.d" --exclude "*.o"

" g~w (toggle the case of the current word)
" g~$ (toggle the case of text from the cursor to the end of the line)


""" built-ins """

filetype on
set autoindent
"set colorcolumn=80
"set cursorline
set expandtab
set hlsearch
set incsearch
set mouse=a " selection: Win:shift+mouse, Mac:fn+mouse,
set nocompatible " u always undo, Ctrl-r always redo,
set nowrapscan
set number
set ruler " older vim on macos not show current line number at status line,
set shiftwidth=4
set tabstop=4
set updatetime=100
"syntax off

" auto save, works with vim but not vim-tiny,
autocmd TextChanged,TextChangedI * if &modifiable && !&readonly && expand("%") != "" && &buftype == "" | silent write | endif

" highlight occurrences of word when cursor is inside the word,
" cancel highlight when cursor is outside.
"let save_isk = &iskeyword | set iskeyword=@,48-57,_,192-255 | autocmd CursorMoved,CursorMovedI * execute 'match Visual' (getline('.')[col('.')-1] =~# '\w' ? '/\<' . escape(expand('<cword>'), '/\.*$^~[]') . '\>/' : '//') | let &iskeyword = save_isk

" search highlight selected text in visual mode(v), press * or # to search,
" search for any non-existing text to cancel the highlight.
"vnoremap <expr> * 'y:let @/ = @" <bar> normal! n<CR>'
"vnoremap <expr> # 'y:let @/ = @" <bar> normal! N<CR>'

" netrw,
"autocmd VimEnter * Lexplore
nnoremap <F2> :Lexplore<CR>
let g:netrw_banner = 0
let g:netrw_browse_split = 4
let g:netrw_list_hide = '.*\.swp$'
let g:netrw_liststyle = 3
let g:netrw_winsize = 16
let g:netrw_mousemaps = 0

" Termdebug,
"packadd! termdebug
"nnoremap <F5> :Termdebug<CR>
"tnoremap <F10> <C-w>:call TermDebugSendCommand('next')<CR>
"tnoremap <F11> <C-w>:call TermDebugSendCommand('step')<CR>
"tnoremap <F12> <C-w>:call TermDebugSendCommand('finish')<CR>


""" non built-in plugins """

" vim-lsp, vim-lsp-settings,
" install for vim at "opt" directory and manually packadd,
" neovim has built-in lsp: tagfunc is set to vim.lsp.tagfunc(),
if !has('nvim')
  packadd! vim-lsp
  packadd! vim-lsp-settings
  set tagfunc=lsp#tagfunc
endif

" Tagbar,
" https://github.com/preservim/tagbar/issues/851 ,
"autocmd QuitPre * qall
"autocmd VimEnter * Tagbar
"let g:tagbar_sort = 0
"nnoremap <F7> :TagbarToggle<CR>

" gutentags,
" ctags: Ctrl-], Ctrl-t, Ctrl-o, Ctrl-i,
" $ mkdir ~/myproject_root_dir/.git
"let g:gutentags_add_default_project_roots = 1
