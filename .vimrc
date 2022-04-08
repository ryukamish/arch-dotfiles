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

" Basic Settings --------------------------{{{
set nocompatible            " Disable compatibility with vi which cause unexpected issues
filetype on                 " Enable type file detection 
filetype plugin on          " Enable plugins and load plugin
filetype indent on          " Load an indent file
syntax on                   " Turn syntax highlighting
set number                  " Adding numbers on left
set shiftwidth=4            " Set shift width to 4 spaces
set tabstop=4               " Set tab width to 4 spaces
set expandtab               " Use space characters instead of tabs
set uc=0                    " No swap file
set incsearch               " Highlighting matching characters as you type
set ignorecase              " Ignore capital letters during search
set smartcase               " search specifically for capital letters
set showcmd                 " Show partial command in the last line of the screen
set showmode                " Show matching words during a search
set nohlsearch              " Use highlighting when doing a search
set history=1000            " Commands to save in history
set clipboard+=unnamedplus  " To help copy/paste things from here and there
set wildmenu                " Enable auto completion menu after pressing TAB
set wildmode=list,longest,full   " Make wildmenu behave like similar to Bash completion
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx
set title                   " To open and jump to another buffer without closing vim
" }}}

" Disable auto commenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Color Scheme ------------------------{{{
" colorscheme molokai
" }}}

" Fold long files -------{{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" Keybindings for folding files
"
" zo => to open a single fold under the cursor
" zc => to close the fold under the cursor
" zR => to open all folds
" zM => to close all folds
" }}}

" Plugins --------{{{
" Run the below command for a pluging manager
" $ curl -fLo ~/.vim/autoload/plug.vim --create-dirs
" https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" to ~/.vim/autolaod/plug.vim

call plug#begin('~/.vim/plugged')

    Plug 'preservim/nerdtree'
    Plug 'vim-airline/vim-airline'
    Plug 'ap/vim-css-color'

call plug#end()
" }}}

" Map keyboard shortcuts ------{{{
" nnoremap => Allows to map keys in normal mode
" inoremap => Allows to map keys in insert mode
" vnoremap => Allows to map keys in visual mode 

inoremap jk <ESC>
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
noremap <c-left> <c-w>>
noremap <c-right> <c-w><
" }}}

" Status Line -----{{{

" Clear status line when vimrc is reloaded.
set statusline=

" Status line left side.
set statusline+=\ %F\ %M\ %Y\ %R
"
" " Use a divider to separate the left side from the right side.
set statusline+=%=
"
" " Status line right side.
set statusline+=\ ascii:\ %b\ hex:\ 0x%B\ row:\ %l\ col:\ %c\ percent:\ %p%%
"
" " Show the status on the second to last line.
set laststatus=2
" }}}

" Saving file options -----------------{{{
" Save file as sudo on files that requires root permission
cnoremap w!! execute 'silent! write !sudo tee %/dev/null' <bar> edit !
" }}}
