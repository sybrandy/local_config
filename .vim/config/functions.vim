" Change the behavior of the F1 key to be more friendly.
inoremap <F1> <Esc>
noremap <F1> :call MapF1()<cr>

function! MapF1()
  if &buftype == "help"
    exec 'quit'
  else
    exec 'help'
  endif
endfunction

fun! CleanFile()
    %s/\r//ge
    %s/\s\+$//ge
endfun

nnoremap <Leader>cf :call CleanFile()<CR>

fun! FixChars()
    %s/‘/'/ge
    %s/’/'/ge
    %s/”/"/ge
    %s/“/"/ge
    %s/±/i/ge
    %s/=-/=\~/ge
    %s/—/-/ge
endfun

nnoremap <Leader>xc :call FixChars()<CR>

nnoremap <Leader>h :'[,']call HtmlEscape()<CR>
vnoremap <Leader>h :call HtmlEscape()<CR>

function HtmlEscape()
  silent s/&/\&amp;/eg
  silent s/</\&lt;/eg
  silent s/>/\&gt;/eg
endfunction
