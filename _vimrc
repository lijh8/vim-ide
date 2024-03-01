

" ~/.vimrc

set autoindent
set colorcolumn=72
set cursorline
set expandtab

"" completion: Ctrl-p, Ctrl-n
"" search: / n N * #
set hlsearch
set incsearch

"" select and copy: windows:shift+mouse, macOS:fn+mouse
set mouse=a

set nowrapscan
set number
set shiftwidth=4
set tabstop=4
set updatetime=100

filetype on
syntax off

"" move line(s) up or down
nnoremap <C-j> mz:move+<cr>`z
nnoremap <C-k> mz:move-2<cr>`z
vnoremap <C-j> :move'>+<cr>`<my`>mzgv`yo`z
vnoremap <C-k> :move'<-2<cr>`>my`<mzgv`yo`z

"" highlight occurrences of word under cursor and clear highlight when cursor is outside
autocmd CursorMoved * execute 'match IncSearch' (getline('.')[col('.')-1] =~# '\w' ? '/\<' . expand('<cword>') . '\>/' : '//')

"" Termdebug
packadd termdebug
nnoremap <F5> :Termdebug<CR>
tnoremap <F10> <C-w>:call TermDebugSendCommand('next')<CR>
tnoremap <F11> <C-w>:call TermDebugSendCommand('step')<CR>
tnoremap <F12> <C-w>:call TermDebugSendCommand('finish')<CR>

"" NERDTree
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
autocmd VimEnter * NERDTree
let g:NERDTreeNodeDelimiter = "\u00a0"
nnoremap <F6> :NERDTreeToggle<CR>
nnoremap <F7> :NERDTreeFind<CR>

"" Tagbar
"" https://github.com/preservim/tagbar/issues/851
autocmd QuitPre * qall
autocmd VimEnter * Tagbar
let g:tagbar_sort = 0
nnoremap <F8> :TagbarToggle<CR>

"" gutentags: ctags: Ctrl-], Ctrl-t, Ctrl-o, Ctrl-i
"" $ mkdir ~/project_root_dir/.git
let g:gutentags_add_default_project_roots = 1

