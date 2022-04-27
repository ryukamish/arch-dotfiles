"               """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"               "               ██╗   ██╗██╗███╗   ███╗██████╗  ██████╗
"               "               ██║   ██║██║████╗ ████║██╔══██╗██╔════╝
"               "               ██║   ██║██║██╔████╔██║██████╔╝██║
"               "               ╚██╗ ██╔╝██║██║╚██╔╝██║██╔══██╗██║
"               "                ╚████╔╝ ██║██║ ╚═╝ ██║██║  ██║╚██████╗
"               "                 ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝
"               "
"               """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" => Assigning mapleader key
let mapleader =","

" => Basic Settings [ Vi Compatible (~/.exrc) ]

set nocompatible            " Disable compatibility with vi which cause unexpected issues
filetype on                 " Enable type file detection
filetype plugin on          " Enable plugins and load plugin
filetype indent on          " Load an indent file
syntax enable               " Turn syntax highlighting
set number                  " Adding numbers on left
set shiftwidth=4            " Set shift width to 4 spaces
set tabstop=4               " Set tab width to 4 spaces
set expandtab               " Use space characters instead of tabs
set uc=0                    " No swap file
set t_Co=256                " Sets if term supports 256 colors
set incsearch               " Highlighting matching characters as you type
set ignorecase              " Ignore capital letters during search
set smartcase               " search specifically for capital letters
set showcmd                 " Show partial command in the last line of the screen
set showmode                " show command and insert mode
set nohlsearch              " Use highlighting when doing a search
set history=1000            " Commands to save in history
set clipboard=unnamedplus   " To help copy/paste things from here and there
set wildmenu                " Enable auto completion menu after pressing TAB
set wildmode=list,longest,full  " Make wildmenu behave like similar to Bash completion
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx
set title                   " Sets the title of the file opened
set path+=**                " To open and jump to another buffer without closing vim
set ruler                   " turn col and row position on the bottom right
set autowrite               " automatically write files when changing when multiple files open
set nofixendofline          " stop vim from Fing files that it shouldn't
set textwidth=72            " enough for line numbers + gutter within 80 standard
set icon
set ttyfast                 " fast scrolling

" Disable auto commenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Color Scheme:
    colorscheme jellybeans

" => Plugins

" Install vim-plug if not installed
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs\
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall
endif

" high contrast:
    set background=dark

" only load plugins if Plug detected:
if filereadable(expand("~/.vim/autoloadd/plug.vim"))
    " load all the plugins
    call plug#begin('~/.vim/plugged')
        Plug 'ap/vim-css-color'
        Plug 'preservim/nerdtree'
        Plug 'tpope/vim-surround'
        Plug 'tpope/vim-commentary'
    call plug#end()

" NerdTree Keybindings:
    map <leader>n :NERDTreeToggle <CR>
    map <leader>f :NERDTreeFind<space>

else
    autocmd vimleavepre *.go !gofmt -w %
endif

" Map keyboard shortcuts
" nnoremap => Allows to map keys in normal mode
" inoremap => Allows to map keys in insert mode
" vnoremap => Allows to map keys in visual mode

" Remaping space for : character
nnoremap <space> :
" You can split the window in Vim by typing :split or :vsplit.
" " Navigate the split view easier by pressing CTRL+j, CTRL+k, CTRL+h, or
" CTRL+l.
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
" Resize split windows using arrow keys by pressing:
" " CTRL+UP, CTRL+DOWN, CTRL+LEFT, or CTRL+RIGHT.
noremap <c-up> <c-w>+
noremap <c-down> <c-w>-
noremap <c-left> <c-w><
noremap <c-right> <c-w>>

" Replace all is aliased to S:
    map <leader>s :%s//g<Left><Left>

" Open terminal in vim:
    map <leader>t :terminal<CR>

" => Removes pipes | that act as seperators on splits
set fillchars+=vert:\

" => Status Line
" Clear status line when vimrc is reloaded.
set statusline=

" Status line left side.
set statusline+=\ %F\ %M\ %Y\ %R

" Show the status on the second to last line.
set laststatus=2

" => Saving file options
" Save file as sudo on files that requires root permission:
    cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" Slstatus automatically recompile and run when editing the source code:
    autocmd BufWritePost ~/.local/src/slstatus/config.h !cd ~/.local/src/slstatus/; sudo make clean install && { killall -q slstatus;setsid slstatus & }

" Automatically deletes all trailing whitespace and newlines at end of file on save. & reset cursor position
autocmd BufWritePre * let currPos = getpos(".")
autocmd BufWritePre * %s/\s\+$//e
autocmd BufWritePre * %s/\n\+\%$//e
autocmd BufWritePre *.[ch] %s/\%$/\r/e
autocmd BufWritePre * cal cursor(currPos[1], currPos[2])
