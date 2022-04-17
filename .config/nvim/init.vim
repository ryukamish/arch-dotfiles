if ! filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim"'))
    echo "Downloading junegunn/vim-plug to manage plugins..."
    silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim
    autocmd VimEnter * PlugInstall
endif

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
set encoding=utf-8              " Setting up encoding
set incsearch			        " Incremental search
syntax enable                   " Turn syntax-highlighting on
set nohlsearch                  " No highlighting while searching
set number relativenumber       " Enabling numbers relative
" Enable autocompletion:
    set wildmode=longest,list,full
" Disable auto commenting on newline:
    autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" Use spaces instead of tabs:
    set expandtab			        " Uses spaces instead of tabs
    set smarttab			        " Be smart using tabs
    set shiftwidth=4		        " One tab == four spaces
    set tabstop=4 			        " One tab == four spaces
    set noswapfile
" Perform dot commands over visual blocks:
    vnoremap . :normal .<CR>

" => Map keyboard shortcuts
" nnoremap => Allows to map keys in normal mode
" inoremap => Allows to map keys in insert mode
" vnoremap => Allows to map keys in visual mode

" Remapping space for : character:
    nnoremap <space> :

" Color scheme
    colorscheme molokai

" Plugins
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

"call plug#begin(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/plugged"'))
"
 "   Plug 'preservim/nerdtree'
 "   Plug 'vim-airline/vim-airline'
 "   Plug 'ap/vim-css-color'
 "   Plug 'vimwiki/vimwiki'
 "   Plug 'neoclide/coc.nvim', {'branch': 'release'}
 "   Plug 'roxma/nvim-completion-manager'
 "   Plug 'SirVer/ultisnips'
 "   Plug 'honza/vim-snippets'
"
"call plug#end()

" Nerd tree:
    map <leader>n :NERDTreeToggle<CR>

" Shortcutting split navigation, saving a keypress:
    nnoremap <C-h> <C-w>h
    nnoremap <C-j> <C-w>j
    nnoremap <C-k> <C-w>k
    nnoremap <C-l> <C-w>l

" Resize split windows using arrow keys by pressing:
    nnoremap <c-up> <c-w>+
    nnoremap <c-down> <c-w>-
    nnoremap <c-left> <c-w>>
    nnoremap <c-right> <c-w><

" Check file in shellcheck:
    map <leader>s :!clear && shellcheck -x %<CR>

" Replace all is aliased to S:
    nnoremap S :%s//g<Left><Left>

" Removes pipes | that act as seperators on splits
    set fillchars+=vert:\

" Save file as sudo on files that requires root permission
    cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" Automatically deletes all trailing whitespace and newlines at end of file on save. & reset cursor position
     autocmd BufWritePre * let currPos = getpos(".")
     autocmd BufWritePre * %s/\s\+$//e
     autocmd BufWritePre * %s/\n\+\%$//e
     autocmd BufWritePre *.[ch] %s/\%$/\r/e
     autocmd BufWritePre * cal cursor(currPos[1], currPos[2])

" Turns off highlighting on the bits of code that are changed, so the line that is changed is highlighted but the actual text that has changed stands out on the line and is readable.
if &diff
    highlight! link DiffText MatchParen
endif

" Dwmblocks automatically recompile and run when editing the source code:
    autocmd BufWritePost ~/.local/src/dwmblocks/config.h !cd ~/.local/src/dwmblocks/; sudo make clean install && { killall -q dwmblocks;setsid dwmblocks & }
