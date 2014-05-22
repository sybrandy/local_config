filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Plugin 'gmarik/vundle'

Plugin 'L9'

" For Rails development.
" Plugin 'dbext.vim'
" Plugin 'git://github.com/tpope/vim-rails.git'

" File Management
Plugin 'http://github.com/scrooloose/nerdtree.git'
nnoremap <Leader>n :NERDTreeToggle<CR>

" Quickly comment/uncomment
Plugin 'tComment'

" Color Scheme
Plugin 'redstring.vim'

" Organize data in a tabular format.
Plugin 'https://github.com/godlygeek/tabular.git'

" Color the parentheses by their nesting level.
Plugin 'https://github.com/kien/rainbow_parentheses.vim'
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
Plugin 'git://github.com/tpope/vim-fugitive.git'
Plugin 'airblade/vim-gitgutter'
nmap ]h <Plug>GitGutterNextHunk
nmap [h <Plug>GitGutterPrevHunk

" Perform gitv operations within vim.
Plugin 'git://github.com/gregsexton/gitv'

" Syntax checking for supported file.
Plugin 'https://github.com/scrooloose/syntastic.git'
let g:syntastic_mode_map = { 'mode' : 'active', 'passive_filetypes': ['scala','java']}

" Show TODO, FIXME, and more within the given file. (<leader>l)
Plugin 'TaskList.vim'
map <leader>tl :TaskList<cr>

Plugin 'git://github.com/chreekat/vim-paren-crosshairs.git'

Plugin 'https://github.com/tpope/vim-markdown.git'

Plugin 'https://github.com/Yggdroot/indentLine.git'

Plugin 'git://github.com/tpope/vim-endwise.git'

Plugin 'git://github.com/tpope/vim-eunuch.git'

Plugin 'git://github.com/mikelue/vim-maven-plugin.git'

Plugin 'derekwyatt/vim-scala'

Plugin 'http://github.com/sjl/gundo.vim.git'
map <leader>g :GundoToggle<CR>

Plugin 'bling/vim-airline'

Plugin 'ivyl/vim-bling'

Plugin 'https://github.com/Raimondi/delimitMate.git'

Plugin 'https://github.com/Shougo/vimproc.vim.git'
Plugin 'https://github.com/Shougo/unite.vim.git'
Plugin 'https://github.com/Shougo/unite-outline.git'
" For ag or ack.
if executable('ag')
  let g:unite_source_rec_async_command = 'ag --nocolor --nogroup --hidden -g ""'
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nocolor -t --noheading -S'
  let g:unite_source_grep_recursive_opt = ''
elseif executable('ack-grep')
  let g:unite_source_grep_command = 'ack-grep'
  let g:unite_source_grep_default_opts = '--no-heading --no-color -a -H'
  let g:unite_source_grep_recursive_opt = '-r'
endif
map <leader>f :Unite -start-insert -no-split file_rec/async<cr>
map <leader>b :Unite -quick-match -auto-preview -no-split buffer<cr>
map <leader>s :Unite -auto-preview -no-split grep:.<cr>
map <leader>l :Unite outline<cr>

map <leader>m :Unite menu<cr>

Plugin 'https://github.com/benmills/vimux.git'
let g:VimuxOrientation='h'
let g:VimuxHeight='40'
map <Leader>vp :VimuxPromptCommand<CR>
map <Leader>vl :VimuxRunLastCommand<CR>
map <Leader>vq :VimuxCloseRunner<CR>
map <Leader>vx :VimuxInterruptRunner<CR>

" Snippets.
Plugin 'Shougo/neocomplcache'
Plugin 'Shougo/neosnippet'
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
if has('conceal')
  set conceallevel=2 concealcursor=i
endif
let g:neosnippet#snippets_directory='~/.vim/snippets/'

" Task management/TODO List
Plugin 'davidoc/taskpaper.vim'
let g:task_paper_date_format = '%Y-%m-%dT%H:%M:%S%z'

" GnuPG config
Plugin 'jamessan/vim-gnupg'
let g:GPGPreferArmor=1
let g:GPGPreferSign=1
let g:GPGExecutable='gpg2'

Plugin 'terryma/vim-expand-region'

Plugin 'myusuf3/numbers.vim'
nnoremap <F3> :NumbersToggle<CR>

Plugin 'zirrostig/vim-schlepp'
vmap <unique> <up>    <Plug>SchleppUp
vmap <unique> <down>  <Plug>SchleppDown
vmap <unique> <left>  <Plug>SchleppLeft
vmap <unique> <right> <Plug>SchleppRight

" This needs to be done after all the vundel config is taken care of.
filetype plugin indent on
