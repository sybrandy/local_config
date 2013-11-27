" This function is used to see what the file encoding is set to.  It's used in
" the status line.
function! Cream_statusline_fileencoding()
	if &fileencoding == ""
		return &encoding
	else
		return &fileencoding
	endif
endfunction


hi link User1 Statusline
hi Statusline cterm=NONE
hi User1 ctermfg=231 ctermbg=236 cterm=NONE
hi User4 ctermfg=238 ctermbg=236 cterm=bold
hi User5 ctermfg=76  ctermbg=236 cterm=bold
hi User6 ctermfg=196 ctermbg=236 cterm=bold
let g:last_mode = ""

function! Mode()
    let l:mode = mode()

    if l:mode !=# g:last_mode "Mode change
        let g:last_mode = l:mode
        if     mode ==# "n"  | hi User2 ctermfg=28  ctermbg=22  cterm=bold | hi User3 ctermfg=22  ctermbg=236
        elseif mode ==# "i"  | hi User2 ctermfg=23  ctermbg=231 cterm=bold | hi User3 ctermfg=231 ctermbg=236
        elseif mode ==# "R"  | hi User2 ctermfg=231 ctermbg=160 cterm=bold | hi User3 ctermfg=160 ctermbg=236
        elseif mode ==? "v"  | hi User2 ctermfg=160 ctermbg=208 cterm=bold | hi User3 ctermfg=208 ctermbg=236
        elseif mode ==# "^V" | hi User2 ctermfg=160 ctermbg=208 cterm=bold | hi User3 ctermfg=208 ctermbg=236
        endif
    endif

    if     mode ==# "n"  | return "  NORMAL "
    elseif mode ==# "i"  | return "  INSERT "
    elseif mode ==# "R"  | return "  REPLACE "
    elseif mode ==# "v"  | return "  VISUAL "
    elseif mode ==# "V"  | return "  V·LINE "
    elseif mode ==# "^V" | return "  V·BLOCK "
    else                 | return l:mode
    endif
endfunc

" Configure the status line.  It shows the full file path, if it's been
" modified, the file format and encoding, the last modified date, and the
" cursor position information.
set laststatus=2
set highlight=sr

" Show the mode that we're currently in.
set statusline=%3*%{Mode()}
" Current file + path.
set statusline+=\ %<%F%m%r%h%w
" Type of the file.
set statusline+=\ %y
" The current branch
set statusline+=\ %{fugitive#statusline()}
" The encoding of the file.
set statusline+=\ [%{&ff}:%{Cream_statusline_fileencoding()}]
" Right-justify the rest of the status bar.
set statusline+=%=
" Timestamp for the file.
set statusline+=\ [%{strftime(\"%Y-%m-%d\ %H:%M\",getftime(expand(\"%:p\")))}]
" Position within the file.
set statusline+=\ [%l,%L:%c][%p%%]
" Syntastic options
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
