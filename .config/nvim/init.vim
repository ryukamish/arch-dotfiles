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
    colorscheme jellybeans

" => Plugins

call plug#begin(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/plugged"'))

  Plug 'tpope/vim-surround'
  Plug 'preservim/nerdtree'
  Plug 'ap/vim-css-color'
  Plug 'tpope/vim-commentary'

call plug#end()

" Nerdtree Keybindings:
    map <leader>n :NERDTreeToggle<CR>
    map <leader>f :NERDTreeFind<space>

" Shortcutting split navigation, saving a keypress:
    nnoremap <C-h> <C-w>h
    nnoremap <C-j> <C-w>j
    nnoremap <C-k> <C-w>k
    nnoremap <C-l> <C-w>l

" Resize split windows using arrow keys by pressing:
    nnoremap <c-up> <c-w>+
    nnoremap <c-down> <c-w>-
    nnoremap <c-left> <c-w><
    nnoremap <c-right> <c-w>>

" Replace all is aliased to S:
    nnoremap S :%s//g<Left><Left>

" Open terminal in neovim:
    map <leader>t :terminal<CR>

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

" Slstatus automatically recompile and run when editing the source code:
    autocmd BufWritePost ~/.local/src/slstatus/config.h !cd ~/.local/src/slstatus/; sudo make clean install && { killall -q slstatus;setsid slstatus & }

" Dmenu auto recompile after editing source code:
    autocmd BufWritePost ~/.local/src/dmenu/config.h !cd ~/.local/src/dmenu/; sudo make clean install

" St auto recompile after editing source code:
    autocmd BufWritePost ~/.local/src/st/config.h !cd ~/.local/src/st/; sudo make clean install

" Function for toggling the bottom statusbar:
let s:hidden_all = 0
function! ToggleHiddenAll()
    if s:hidden_all  == 0
        let s:hidden_all = 1
        set noshowmode
        set noruler
        set laststatus=0
        set noshowcmd
    else
        let s:hidden_all = 0
        set showmode
        set ruler
        set laststatus=2
        set showcmd
    endif
endfunction
nnoremap <leader>h :call ToggleHiddenAll()<CR>
