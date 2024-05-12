
" ~/.vimrc

filetype on

set autochdir
set autoindent
set colorcolumn=72
set cursorline
set expandtab

" completion: Ctrl-p, Ctrl-n
" search: / ? n N * #
set hlsearch
set incsearch

set nowrapscan
set number
set ruler
set shiftwidth=4
set tabstop=4
set updatetime=100

syntax off

" highlight occurrences of word when cursor is inside the word and cancel highlight when cursor is outside
let save_isk = &iskeyword | set iskeyword=@,48-57,_,192-255 | autocmd CursorMoved,CursorMovedI * execute 'match Visual' (getline('.')[col('.')-1] =~# '\w' ? '/\<' . escape(expand('<cword>'), '/\.*$^~[]') . '\>/' : '//') | let &iskeyword = save_isk

" search highlight selected text in visual mode(v), press * or # to search
" search for any non-existing text to cancel the highlight
vnoremap <expr> * 'y:let @/ = @" <bar> normal! n<CR>'
vnoremap <expr> # 'y:let @/ = @" <bar> normal! N<CR>'

" netrw
" cd my_dir; 
" vi  # just vi, specify no file or directory name 
autocmd VimEnter * Lexplore
nnoremap <F6> :Lexplore<CR>
let g:netrw_banner = 0
let g:netrw_browse_split = 4
let g:netrw_liststyle = 3
let g:netrw_winsize = 16

" C-W-H, C-W-L, C-W-J, C-W-K,
" :copen
" :make
" :grep -r main *
" :vimgrep main *

" Termdebug
packadd termdebug
nnoremap <F5> :Termdebug<CR>
tnoremap <F10> <C-w>:call TermDebugSendCommand('next')<CR>
tnoremap <F11> <C-w>:call TermDebugSendCommand('step')<CR>
tnoremap <F12> <C-w>:call TermDebugSendCommand('finish')<CR>

" Tagbar
" https://github.com/preservim/tagbar/issues/851
autocmd QuitPre * qall
autocmd VimEnter * Tagbar
let g:tagbar_sort = 0
nnoremap <F7> :TagbarToggle<CR>

" gutentags: ctags: Ctrl-], Ctrl-t, Ctrl-o, Ctrl-i
" $ mkdir ~/project_root_dir/.git
let g:gutentags_add_default_project_roots = 1
