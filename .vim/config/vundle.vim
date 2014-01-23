filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle "gmarik/vundle"

Bundle "L9"

" For Rails development.
" Bundle "dbext.vim"
" Bundle "git://github.com/tpope/vim-rails.git"

" File Management
Bundle "http://github.com/scrooloose/nerdtree.git"
nnoremap <Leader>n :NERDTreeToggle<CR>

" Quickly comment/uncomment
Bundle "tComment"

" Color Scheme
Bundle "redstring.vim"

" Show the methods, etc. within the current file.
Bundle "http://github.com/majutsushi/tagbar.git"
nnoremap <silent> <F9> :TagbarToggle<CR>

" Organize data in a tabular format.
Bundle "https://github.com/godlygeek/tabular.git"

" Color the parentheses by their nesting level.
Bundle "https://github.com/kien/rainbow_parentheses.vim"
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['lightgrey',   'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

" Used currently just to see which branch we're working on.
Bundle "git://github.com/tpope/vim-fugitive.git"

" Perform gitv operations within vim.
Bundle "git://github.com/gregsexton/gitv"

" Syntax checking for supported file.
Bundle "https://github.com/scrooloose/syntastic.git"
let g:syntastic_mode_map = { 'mode' : 'active', 'passive_filetypes': ['scala','java']}

" Show TODO, FIXME, and more within the given file. (<leader>l)
Bundle "TaskList.vim"
map <leader>l <Plug>TaskList

Bundle "git://github.com/chreekat/vim-paren-crosshairs.git"

Bundle "https://github.com/tpope/vim-markdown.git"

Bundle "https://github.com/Yggdroot/indentLine.git"

Bundle "git://github.com/tpope/vim-endwise.git"

Bundle "git://github.com/tpope/vim-eunuch.git"

Bundle "git://github.com/mikelue/vim-maven-plugin.git"

Bundle 'derekwyatt/vim-scala'

Bundle 'http://github.com/sjl/gundo.vim.git'
map <leader>g :GundoToggle<CR>

Bundle 'bling/vim-airline'

Bundle 'mhinz/vim-signify'

Bundle 'ivyl/vim-bling'

Bundle 'https://github.com/Raimondi/delimitMate.git'

Bundle 'https://github.com/Shougo/vimproc.vim.git'
Bundle 'https://github.com/Shougo/unite.vim.git'
" For ag or ack.
if executable('ag')
  let g:unite_source_rec_async_command = 'ag --nocolor --nogroup --hidden -g ""'
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nocolor -t --noheading'
  let g:unite_source_grep_recursive_opt = ''
elseif executable('ack-grep')
  let g:unite_source_grep_command = 'ack-grep'
  let g:unite_source_grep_default_opts = '--no-heading --no-color -a -H'
  let g:unite_source_grep_recursive_opt = '-r'
endif
" nnoremap <C-p> :Unite -start-insert file_rec/async<cr>
map <leader>f :Unite -start-insert file_rec/async<cr>
map <leader>b :Unite -quick-match -auto-preview buffer<cr>
map <leader>s :Unite -auto-preview grep:.<cr>

Bundle 'https://github.com/osyo-manga/vim-over.git'
map <leader>o :OverCommandLine<cr>

Bundle 'https://github.com/benmills/vimux.git'
let g:VimuxOrientation="h"
let g:VimuxHeight="40"
map <Leader>vp :VimuxPromptCommand<CR>
map <Leader>vl :VimuxRunLastCommand<CR>
map <Leader>vq :VimuxCloseRunner<CR>
map <Leader>vx :VimuxInterruptRunner<CR>

" Snippets.
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/neosnippet'
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
if has('conceal')
  set conceallevel=2 concealcursor=i
endif
let g:neosnippet#snippets_directory="~/.vim/snippets/"

" Task management/TODO List
Bundle 'davidoc/taskpaper.vim'
let g:task_paper_date_format = "%Y-%m-%dT%H:%M:%S%z"

" This needs to be done after all the vundel config is taken care of.
filetype plugin indent on
