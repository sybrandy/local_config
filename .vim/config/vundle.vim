filetype off
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
  if !isdirectory(expand('~/.vim/bundle/neobundle.vim'))
    echo "Installing NeoBundle\n"
    silent execute '!mkdir -p ~/.vim/bundle'
    silent execute '!git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim'
  endif
endif
call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch "Shougo/neobundle.vim"

" NOTES:
" 1. Re-look at NeoBundleLazy for plugins that are file-type specific.
"    - Does this works with autoload?
" 2. Periodically call NeoBundleGC.  Perhaps make this part of an update?
" 3. Remember that specific revisions can be specified.
" 4. Use the depends option (neobundle-options-depends)
" 5. For plugins that need make or similar, use the build option.
" (neobundle-options-build)
" 6. augroup may need to be set for certain plugins.
" (neobundle-options-augroup)

NeoBundle 'L9'

" Quickly comment/uncomment
NeoBundle 'tComment'

" Color Scheme
NeoBundle 'redstring.vim'

" Organize data in a tabular format.
NeoBundle 'https://github.com/godlygeek/tabular.git'

" Color the parentheses by their nesting level.
NeoBundle 'https://github.com/kien/rainbow_parentheses.vim'
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
NeoBundle 'airblade/vim-gitgutter', {'depends': 'tpope/vim-fugitive'}
nmap ]h <Plug>GitGutterNextHunk
nmap [h <Plug>GitGutterPrevHunk

" Perform gitv operations within vim.
NeoBundle 'git://github.com/gregsexton/gitv'

" Syntax checking for supported file.
NeoBundle 'https://github.com/scrooloose/syntastic.git'
let g:syntastic_mode_map = { 'mode' : 'active', 'passive_filetypes': ['scala','java']}

" Show TODO, FIXME, and more within the given file. (<leader>tl)
NeoBundle 'TaskList.vim'
map <leader>tl :TaskList<cr>

NeoBundle 'git://github.com/chreekat/vim-paren-crosshairs.git'

NeoBundleLazy 'tpope/vim-markdown'
autocmd Filetype md,mkdown,mdown NeoBundleSource vim-markdown

NeoBundle 'https://github.com/Yggdroot/indentLine.git'

NeoBundle 'git://github.com/tpope/vim-endwise.git'

NeoBundle 'git://github.com/tpope/vim-eunuch.git'

NeoBundleLazy 'derekwyatt/vim-scala'
autocmd Filetype scala NeoBundleSource vim-scala

NeoBundle 'http://github.com/sjl/gundo.vim.git'
map <leader>gu :GundoToggle<CR>

NeoBundle 'itchyny/lightline.vim'
let g:lightline = {
      \ 'colorscheme': 'jellybeans',
      \ 'mode_map': { 'c': 'NORMAL' },
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
      \ },
      \ 'component_function': {
      \   'modified': 'LightLineModified',
      \   'readonly': 'LightLineReadonly',
      \   'fugitive': 'LightLineFugitive',
      \   'filename': 'LightLineFilename',
      \   'fileformat': 'LightLineFileformat',
      \   'filetype': 'LightLineFiletype',
      \   'fileencoding': 'LightLineFileencoding',
      \   'mode': 'LightLineMode',
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }

function! LightLineModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightLineReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? '⭤' : ''
endfunction

function! LightLineFilename()
  return ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

function! LightLineFugitive()
  if &ft !~? 'vimfiler\|gundo' && exists("*fugitive#head")
    let _ = fugitive#head()
    return strlen(_) ? ' '._ : ''
  endif
  return ''
endfunction

function! LightLineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightLineFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! LightLineFileencoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! LightLineMode()
  let fname = expand('%:t')
  return  fname == '__Gundo__' ? 'Gundo' :
        \ fname == '__Gundo_Preview__' ? 'Gundo Preview' :
        \ &ft == 'vimfiler' ? 'VimFiler' :
        \ &ft == 'unite' ? 'Unite' :
        \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

NeoBundle 'Shougo/vimproc.vim', { 'build': {'unix': 'make'}}
NeoBundle 'Shougo/unite-outline', {'depends': 'Shougo/unite.vim'}
NeoBundle 'Shougo/vimfiler.vim', {'depends': 'Shougo/unite.vim'}
NeoBundle 'thinca/vim-unite-history', {'depends': 'Shougo/unite.vim'}
NeoBundle 'moznion/unite-git-conflict.vim', {'depends': 'Shougo/unite.vim'}
" For ag or ack.
if executable('ag')
  " let g:unite_source_rec_async_command = 'ag --nocolor --nogroup --hidden -g ""'
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nocolor -t --noheading -S -i'
  let g:unite_source_grep_recursive_opt = ''
elseif executable('ack-grep')
  let g:unite_source_grep_command = 'ack-grep'
  let g:unite_source_grep_default_opts = '--no-heading --no-color -a -H -i'
  let g:unite_source_grep_recursive_opt = '-r'
endif
" Detect if in a source controlled directory.  If not, then fall back to the
" file_rec/async
if !empty(glob(".git"))
    map <leader>f :Unite -start-insert -no-split -buffer-name=files file_rec/git<cr>
else
    map <leader>f :Unite -start-insert -no-split -buffer-name=files file_rec/async<cr>
endif
map <leader>b :Unite -auto-preview -start-insert -buffer-name=buffers -no-split buffer<cr>
map <leader>s :Unite -auto-preview -no-split -buffer-name=search grep:.<cr>
map <leader>o :Unite -start-insert -buffer-name=outline outline<cr>
map <leader>l :Unite -start-insert -buffer-name=lines line<cr>
map <leader>r :Unite -start-insert -buffer-name=registers register<cr>
map <leader>y :Unite -no-split -buffer-name=yank history/yank<cr>
map <leader>vf :VimFiler<cr>
map <leader>gc :Unite git-conflict<cr>
map <leader>hc :Unite -no-split -buffer-name=command history/command<cr>
map <leader>hs :Unite -no-split -buffer-name=search history/search<cr>
map <leader>n :UniteNext<cr>
map <leader>p :UnitePrevious<cr>

" NeoBundle Commands
map <leader>nu :Unite -no-split -buffer-name=neobundle neobundle/update -log<cr>

map <leader>m :Unite -start-insert menu<cr>

NeoBundle 'https://github.com/benmills/vimux.git'
let g:VimuxOrientation='h'
let g:VimuxHeight='40'
map <Leader>vp :VimuxPromptCommand<CR>
map <Leader>vl :VimuxRunLastCommand<CR>
map <Leader>vq :VimuxCloseRunner<CR>
map <Leader>vx :VimuxInterruptRunner<CR>

" Snippets.
NeoBundle 'Shougo/neosnippet', {'depends': 'Shougo/neocomplcache' }
NeoBundle 'Shougo/neosnippet-snippets', {'depends': 'Shougo/neosnippet' }
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
if has('conceal')
  set conceallevel=2 concealcursor=i
endif
let g:neosnippet#snippets_directory='~/.vim/snippets/'

" Task management/TODO List
NeoBundleLazy 'davidoc/taskpaper.vim'
let g:task_paper_date_format = '%Y-%m-%dT%H:%M:%S%z'

" GnuPG config
NeoBundleLazy 'jamessan/vim-gnupg'
let g:GPGPreferArmor=1
let g:GPGPreferSign=1
let g:GPGExecutable='gpg2'

NeoBundleLazy 'myusuf3/numbers.vim'
nnoremap <leader>tn :NumbersToggle<CR>

NeoBundleLazy 'vim-scripts/neat.vim'

NeoBundleLazy 'terryma/vim-multiple-cursors'

NeoBundle 'dzeban/vim-log-syntax'

NeoBundleLazy 'fatih/vim-go'

NeoBundleLazy 'nicwest/QQ.vim'

" This needs to be done after all the NeoBundle config is taken care of.
NeoBundleCheck
call neobundle#end()
filetype plugin indent on
