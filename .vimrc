" Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
    Plugin 'VundleVim/Vundle.vim'
    Plugin 'itchyny/lightline.vim'
    Plugin 'flazz/vim-colorschemes'
    Plugin 'rykka/mathematic.vim'
    Plugin 'hari-rangarajan/CCTree'
    Plugin 'devjoe/vim-codequery'
    Plugin 'Chiel92/vim-autoformat'
    " Plugin 'fatih/vim-go'
    Plugin 'sheerun/vim-polyglot'
    Plugin 'fatih/vim-hclfmt'
    Plugin 'Shougo/deoplete.nvim'
    Plugin 'roxma/nvim-yarp'
    Plugin 'roxma/vim-hug-neovim-rpc'
    Plugin 'Shougo/neco-syntax'
    Plugin 'vim-syntastic/syntastic'
    Plugin 'calviken/vim-gdscript3'
call vundle#end()

" general
set backup
set history=50
set ruler
set showcmd
set incsearch
set number

set backupdir=~/.vim/tmp,.
set directory=~/.vim/tmp,.

if has('mouse')
    set mouse=a
endif


let g:python_host_prog  = '/usr/bin/python'
let g:python3_host_prog = '/usr/bin/python3'

" UI
set background=light

" set theme based on time of day
if strftime("%H") < 23 && strftime("%H") >= 5
    colorscheme scheakur
else
    colorscheme desertEx
endif

let g:lightline = {
            \ 'colorscheme': 'seoul256',
            \ }
set laststatus=2

if &t_Co > 2 || has("gui_running")
    syntax on
    set hlsearch
endif

" spelling
set spell spelllang=en

" terminal settings
set encoding=utf-8
set fileencoding=utf-8
set t_Co=256
set term=xterm-256color
set termencoding=utf-8

" manage tabs
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

" Highlight Long Lines
set colorcolumn=80
hi clear SpellBad
hi SpellBad cterm=underline

" Key Binding.

set backspace=indent,eol,start

command W w
command Q q
command WQ wq
map <C-a> :!make
map <F7> mzgg=G`z
map Q gq
inoremap <C-U> <C-G>u<C-U>


cmap w!! w !sudo tee > /dev/null %

" Mathematic

map <leader>km :set keymap=mathematic<CR>
map <leader>kn :set keymap=<CR>
nmap <leader>\ :KeyHelper<CR>
let g:mathematic_fuzzymatch = 1

if has("autocmd")
    filetype plugin indent on
    augroup vimrcEx
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

    augroup END
endif " has("autocmd")

if !exists(":DiffOrig")
    command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
                \ | wincmd p | diffthis
endif

let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 0

" Deoplete

let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1

" Disable the candidates in Comment/String syntaxes.
call deoplete#custom#source('_',
            \ 'disabled_syntaxes', ['Comment', 'String'])

autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" HCL
let g:hcl_fmt_autosave = 0
let g:tf_fmt_autosave = 0
let g:nomad_fmt_autosave = 0

" Syntastic
" set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_javascript_checkers = ['eslint']

let g:syntastic_error_symbol = 'x'
let g:syntastic_style_error_symbol = '#'
let g:syntastic_warning_symbol = '!'
let g:syntastic_style_warning_symbol = '^'

highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn
