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
Plugin 'neomake/neomake'
" Plugin 'vim-syntastic/syntastic'
Plugin 'calviken/vim-gdscript3'
Plugin 'vimwiki/vimwiki'
Plugin 'benjie/local-npm-bin.vim'
Plugin 'junegunn/rainbow_parentheses.vim'
" Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'Yggdroot/indentLine'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-scripts/Arduino-syntax-file'
Plugin 'coddingtonbear/neomake-platformio'
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

" set theme based on time of day
if strftime("%H") < 23 && strftime("%H") >= 5
    colorscheme scheakur
    set background=light
else
    colorscheme desertEx
    set background=dark
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
" set term=xterm-256color
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

call neomake#configure#automake('w')

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


let g:rainbow#max_level = 16
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]

augroup rainbow_lisp
    autocmd!
    autocmd FileType lisp,clojure,scheme,javascript,c,rust,python RainbowParentheses
augroup END

let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1

if &l:background == 'dark'
  hi! RainbowLevel0 ctermfg=142 guifg=#b8bb26
  hi! RainbowLevel1 ctermfg=108 guifg=#8ec07c
  hi! RainbowLevel2 ctermfg=109 guifg=#83a598
  hi! RainbowLevel3 ctermfg=175 guifg=#d3869b
  hi! RainbowLevel4 ctermfg=167 guifg=#fb4934
  hi! RainbowLevel5 ctermfg=208 guifg=#fe8019
  hi! RainbowLevel6 ctermfg=214 guifg=#fabd2f
  hi! RainbowLevel7 ctermfg=223 guifg=#ebdbb2
  hi! RainbowLevel8 ctermfg=245 guifg=#928374
else
  hi! RainbowLevel0 ctermfg=100 guifg=#79740e
  hi! RainbowLevel1 ctermfg=066 guifg=#427b58
  hi! RainbowLevel2 ctermfg=024 guifg=#076678
  hi! RainbowLevel3 ctermfg=096 guifg=#8f3f71
  hi! RainbowLevel4 ctermfg=088 guifg=#9d0006
  hi! RainbowLevel5 ctermfg=130 guifg=#af3a03
  hi! RainbowLevel6 ctermfg=136 guifg=#b57614
  hi! RainbowLevel7 ctermfg=244 guifg=#928374
  hi! RainbowLevel8 ctermfg=237 guifg=#3c3836
endif

let g:indentLine_conceallevel = &conceallevel
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_concealcursor = 'inc'
let g:indentLine_enabled = 1
let g:indentLine_setColors = 1
let g:indentLine_leadingSpaceChar = ' '
let g:indentLine_leadingSpaceEnabled = 1

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>

set foldmethod=indent

augroup OpenAllFoldsOnFileOpen
    autocmd!
    autocmd BufRead * normal zR
augroup END

