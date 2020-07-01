" general
set backup
set history=50
set ruler
set showcmd
set incsearch
set number
set guicursor=
" manage tabs
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
" spelling
set spell spelllang=en
" terminal settings
set encoding=utf-8
set fileencoding=utf-8
set t_Co=256
" set term=xterm-256color
set termencoding=utf-8

let g:python_host_prog  = '/usr/bin/python3'
let g:python3_host_prog = '/usr/bin/python3'

set backupdir=~/.vim/tmp,.
set directory=~/.vim/tmp,.

" autoformat
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 0
