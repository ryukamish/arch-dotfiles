" => Assigning mapleader key
let mapleader =","

" => Basic settings
set nocompatible		        " ViMproved
set title
set mouse=v                     " Middle mouse click to paste
filetype on                     " Enable type file detection
filetype plugin on              " Enables plugins and load plugins
set path+=**			        " Searches current path recursively
set clipboard=unnamedplus       " Using system clipboard
set hidden			            " Needed to keep multiple buffers open
set autoindent                  " Indent a new line the same amount as the line just typed
set t_Co=256			        " Sets if term supports 256 colors
set ttyfast                     " Speed up scrolling in Vim
set incsearch			        " Incremental search
syntax enable                   " Turn syntax-highlighting on
set nohlsearch                  " No highlighting while searching
set number relativenumber       " Enabling numbers relative
" Enable autocompletion:
    set wildmode=longest,list,full
" Disable auto commenting on newline:
    autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" Use spaces instead of tabs
set expandtab			        " Uses spaces instead of tabs
set smarttab			        " Be smart using tabs
set shiftwidth=4		        " One tab == four spaces
set tabstop=4 			        " One tab == four spaces
set noswapfile

" => Map keyboard shortcuts
" nnoremap => Allows to map keys in normal mode
" inoremap => Allows to map keys in insert mode
" vnoremap => Allows to map keys in visual mode

" Remapping space for : character
nnoremap <space> :

" => Plugins
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin("~/.vim/plugged")

    Plug 'preservim/nerdtree'
    Plug 'vim-airline/vim-airline'
    Plug 'ap/vim-css-color'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'roxma/nvim-completion-manager'

call plug#end()

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
