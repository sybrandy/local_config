set errorformat+=%f(%l):\ %m
if has('conceal')
    autocmd Syntax d syn match dKeyword "=>" conceal cchar=λ
    hi! link Conceal Operator
    set conceallevel=2
endif
