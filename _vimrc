
" ~/.vimrc

set autochdir
set autoindent
set autowriteall
set colorcolumn=72
set cursorline
set expandtab

" completion: Ctrl-p, Ctrl-n
" search: / ? n N * #
set hlsearch
set incsearch

" select and copy: windows:shift+mouse, macOS:fn+mouse
set mouse=a

set nowrapscan
set number
set shiftwidth=4
set tabstop=4
set updatetime=100

filetype on
syntax off

" save file in insert mode and remain in insert mode
" return to insert mode with the a command
inoremap <C-s> <Esc>:w<CR>a
nnoremap <C-s> :w<CR>
vnoremap <C-s> <Esc>:w<CR>

" move lines up or down
inoremap <C-k> <Esc>m`:move-2<CR>``a
inoremap <C-j> <Esc>m`:move+<CR>``a
nnoremap <C-k> m`:move-2<CR>``
nnoremap <C-j> m`:move+<CR>``
vnoremap <C-k> :move'<-2<CR>gv
vnoremap <C-j> :move'>+<CR>gv

" highlight occurrences of word when cursor is inside the word and cancel highlight when cursor is outside
let save_isk = &iskeyword 
 \ | set iskeyword=@,48-57,_,192-255 
 \ | autocmd CursorMoved,CursorMovedI * execute 'match Visual' (getline('.')[col('.')-1] =~# '\w' ? '/\<' . escape(expand('<cword>'), '/\.*$^~[]') . '\>/' : '//') 
 \ | let &iskeyword = save_isk

" search highlight by select in visual mode(v), press * or # to search
" search for any non-existing text to cancel the highlight
vnoremap <expr> * 'y:let @/ = @" <bar> normal! n<CR>'
vnoremap <expr> # 'y:let @/ = @" <bar> normal! N<CR>'

" Termdebug
packadd termdebug
nnoremap <F5> :Termdebug<CR>
tnoremap <F10> <C-w>:call TermDebugSendCommand('next')<CR>
tnoremap <F11> <C-w>:call TermDebugSendCommand('step')<CR>
tnoremap <F12> <C-w>:call TermDebugSendCommand('finish')<CR>

" netrw
autocmd VimEnter * Lexplore
nnoremap <F6> :Lexplore<CR>
let g:netrw_banner = 0
let g:netrw_browse_split = 4
let g:netrw_liststyle = 3
let g:netrw_winsize = 16

" Tagbar
" https://github.com/preservim/tagbar/issues/851
autocmd QuitPre * qall
autocmd VimEnter * Tagbar
let g:tagbar_sort = 0
nnoremap <F7> :TagbarToggle<CR>

" gutentags: ctags: Ctrl-], Ctrl-t, Ctrl-o, Ctrl-i
" $ mkdir ~/project_root_dir/.git
let g:gutentags_add_default_project_roots = 1
