augroup vimrcEx
    filetype plugin indent on
    au!
    autocmd FileType text setlocal textwidth=78
    autocmd BufReadPost *
                \ if line("'\"") > 1 && line("'\"") <= line("$") |
                \   exe "normal! g`\"" |
                \ endif
    autocmd FileType c,python,fortran,ruby,asm,markdown setlocal number
    autocmd FileType yaml,javascript,hcl setlocal tabstop=2
    autocmd FileType yaml,javascript,hcl setlocal shiftwidth=2
    autocmd FileType yaml,javascript,hcl setlocal softtabstop=2
    autocmd FileType haskell setlocal formatprg=hindent
augroup END
