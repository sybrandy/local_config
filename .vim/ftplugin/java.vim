setlocal omnifunc=javacomplete#Complete
noremap <F5> :let $CLASSPATH=system('cat .classpath')<CR>
compiler maven2
