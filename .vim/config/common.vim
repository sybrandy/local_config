set nocompatible
set ic
set guioptions-=T
set splitright
set nowrap
set wildmenu
set wildmode=list:longest
set hlsearch
set t_Co=256

set shiftwidth=4
set tabstop=4
set expandtab
set fileformat=unix
set enc=utf8
set nobackup
set dir=/tmp/
set autoindent
set smartindent
set tw=78
set hidden
set history=1000
set shortmess=atI
" set visualbell
set number
try
    set colorcolumn=80
catch
endtry

filetype plugin on
set foldmethod=marker

try
    set guifont=terminus
catch
endtry

syntax on
syntax sync fromstart
try
    colorscheme redstring
catch
    colorscheme koehler
endtry

let mapleader = ","

au VimEnter * RainbowParenthesesToggle
au BufRead * RainbowParenthesesLoadRound
au BufRead * RainbowParenthesesLoadSquare
au BufRead * RainbowParenthesesLoadBraces

:set list lcs=tab:\¦\ 

if has('conceal')
    autocmd Syntax * syn match Operator "!=" conceal cchar=≠
    hi! link Conceal Operator
    set conceallevel=2
endif

"Open QuickFix window on the bottom regardless of how many windows are open.
au FileType qf wincmd J

let g:airline_powerline_fonts=1
