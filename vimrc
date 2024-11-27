" ~/.vimrc, ~/.virc, ~/.exrc,

" $ vi ~/.bashrc
" stty -ixon  # terminal flow control Ctrl-s conflicts with vim, emacs.
" #stty columns 80
" $

" $ sudo vim -u ~/.vimrc /etc/systemd/system.conf
" $ sudo vim -u /home/ljh/.vimrc /etc/systemd/system.conf

" undo: u, redo: Ctrl-r,
" completion: Ctrl-p, Ctrl-n,
" search: / ? n N * #

" command-line window, search for command history inside vim.
" :Ctrl-f, :Ctrl-p, :Ctrl-n,

" multiple tab(s),
" :e a.txt, :w, :qa, :close,
" :tabnew [a.txt], :tabedit [a.txt],
" gt, gT, [x]gt, :tabn [x],

" multiple buffer(s),
" :args, :n, :N, :rewind,

" search a single letter inside a line,
" search a letter `c`: f c
" repeat forward: ;
" repeat backword: ,

" multiple window,
" C-W-H, C-W-L, C-W-J, C-W-K, C-W-S, C-W-V,
" :resize N, :resize +N, :vertical resize N, :vertical resize +N,

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

" select for copy: windows:shift+mouse, macOS:fn+mouse,
set mouse=a " Win:SHIFT+mouse, Mac:fn+mouse

set nocompatible  " u always undo, Ctrl-r always redo,
set nowrapscan
set number
set ruler
set shiftwidth=4
set tabstop=4
set updatetime=100
"syntax off

" auto save, works with vim but not vim-tiny,
autocmd TextChanged,TextChangedI * if &modifiable && !&readonly && expand("%") != "" && &buftype == "" | silent write | endif

" netrw,
"autocmd VimEnter * Lexplore
nnoremap <F2> :Lexplore<CR>
let g:netrw_banner = 0
let g:netrw_browse_split = 4
let g:netrw_list_hide = '.*\.swp$'
let g:netrw_liststyle = 3
let g:netrw_winsize = 16
let g:netrw_mousemaps = 0

" highlight occurrences of word when cursor is inside the word,
" cancel highlight when cursor is outside.
"let save_isk = &iskeyword | set iskeyword=@,48-57,_,192-255 | autocmd CursorMoved,CursorMovedI * execute 'match Visual' (getline('.')[col('.')-1] =~# '\w' ? '/\<' . escape(expand('<cword>'), '/\.*$^~[]') . '\>/' : '//') | let &iskeyword = save_isk

" search highlight selected text in visual mode(v), press * or # to search,
" search for any non-existing text to cancel the highlight.
"vnoremap <expr> * 'y:let @/ = @" <bar> normal! n<CR>'
"vnoremap <expr> # 'y:let @/ = @" <bar> normal! N<CR>'

" Termdebug,
"packadd! termdebug
"nnoremap <F5> :Termdebug<CR>
"tnoremap <F10> <C-w>:call TermDebugSendCommand('next')<CR>
"tnoremap <F11> <C-w>:call TermDebugSendCommand('step')<CR>
"tnoremap <F12> <C-w>:call TermDebugSendCommand('finish')<CR>


""" non built-in plugins """

" vim-lsp, vim-lsp-settings,
" similar to neovim: tagfunc is set to vim.lsp.tagfunc(),
" add vim-lsp in vim only install in `opt` (not `start`) directory then packadd,
" neovim has built-in lsp, and should source a modified copy eg. ~/.vimrc2,
packadd! vim-lsp          " comment for neovim
packadd! vim-lsp-settings " comment for neovim
set tagfunc=lsp#tagfunc   " comment for neovim

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
