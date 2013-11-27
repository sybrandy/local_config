" Highlighting whitespaces at end of line
highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/

" Check for extra spaces instead of tabs at the front of the line
match WhitespaceEOL /^\ \+/

" Highlight redundant whitespaces.
highlight RedundantSpaces ctermbg=red guibg=red
match RedundantSpaces /\s\+$\| \+\ze\t/

" Abbreviations
" Let's fix the stupid fat-fingering of the.
ab teh the
ab hte the
