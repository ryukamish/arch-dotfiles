set nocompatible		" be iMproved
set title
filetype off
filetype plugin indent on
set path+=**			" Searches current path recursively
set hidden			" Needed to keep multiple buffers open
set t_Co=256			" Sets if term supports 256 colors
set incsearch			" Incremental search
syntax enable
set encoding=utf-8
let g:rehash256 = 1
set number relativenumber
" Enable autocompletion:
    set wildmode=longest,list,full
" Disable auto commenting on newline:
    autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" => Remap ESC to ii
:imap jk <ESC>

" => Use spaces instead of tabs
set expandtab			" Uses spaces instead of tabs
set smarttab			" Be smart using tabs
set shiftwidth=4		" One tab == four spaces
set tabstop=4 			" One tab == four spaces

" => Splits and Tabbed Files
set splitbelow splitright

" => Removes pipes | that act as seperators on splits
set fillchars+=vert:\

" Save file as sudo on files that requires root permission
    cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" Automatically deletes all trailing whitespace and newlines at end of file on save. & reset cursor position
     autocmd BufWritePre * let currPos = getpos(".")
     autocmd BufWritePre * %s/\s\+$//e
     autocmd BufWritePre * %s/\n\+\%$//e
     autocmd BufWritePre *.[ch] %s/\%$/\r/e
     autocmd BufWritePre * cal cursor(currPos[1], currPos[2])

