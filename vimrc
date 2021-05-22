" Setup stuff
" ===========

" Use vim rather than vi settings
set nocompatible

" Shell stuff here

" Set shell to zsh (fish and VIM don't play well together)
set shell=zsh
"Don't dump distracting text to terminal during searchesr
ret shellpipe=2>/dev/null>

" Plugins here
" =============

"Setup Vundle For Package Management

"Vundle begins here, turn off filetype temporarily
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

"My plugins

" Themes
"Plugin 'altercation/vim-colors-solarized'
"Plugin 'chriskempson/base16-vim'
"Plugin 'reedes/vim-colors-pencil'

" Syntax
"Plugin 'skammer/vim-css-color'
"Plugin 'plasticboy/vim-markdown'
"Plugin 'jelera/vim-javascript-syntax'
"Plugin 'elzr/vim-json'

" Functionality

" ### Indispensable
" Ruby ones
Plugin 'thoughtbot/vim-rspec'
Plugin 'tpope/vim-endwise'
" ctrlp is file fuzzy search
Plugin 'kien/ctrlp.vim'
" Ack.vim uses ack to search within files
"Plugin 'mileszs/ack.vim'
"Airline provides a stylish appearance for the styleline
Plugin 'bling/vim-airline'
" Syntastic provides syntax info
"Plugin 'scrooloose/syntastic'
"Show git info in the gutter, sad that it and syntastic fight for space though
Plugin 'airblade/vim-gitgutter'
"Integrate with tmux
"Plugin 'christoomey/vim-tmux-navigator'
"Provides Sublime-Text like smart completion of braces, parens and such
"Plugin 'Raimondi/delimitMate'

" Language packs for syntax highlight
Plugin 'sheerun/vim-polyglot'

" ### Use sometimes

" Nerdtree provides a file explorer, which is sometimes useful. Mostly ctrlp handles file finding though
Plugin 'scrooloose/nerdtree'
" fugitive provides git bindings in Vim.  Don't use too much, but useful for blame
"Plugin 'tpope/vim-fugitive'
" Surround is useful for adding surrounding tags to elements (especially html)
"Plugin 'tpope/vim-surround'
" Allows vim-surround to be used with . command
"Plugin 'tpope/vim-repeat'
"Gives smart completions for Javascript
"Plugin 'marijnh/tern_for_vim'
" Provides easy shortcuts for commenting out lines
"Plugin 'scrooloose/nerdcommenter'
" Great helpful autocompletion
"Plugin 'Valloric/YouCompleteMe'
"Adds convenience stuff for writers
"Plugin 'reedes/vim-pencil'
" Allows for different situational Vim themes
"Plugin 'reedes/vim-thematic'

" Experimenting with these

"Plugin 'SirVer/ultisnips'
"Plugin 'tpope/vim-unimpaired'

" Not Using anymore/right now
" Provides an alternative way to move quickly through files
"Plugin 'Lokaltog/vim-easymotion'
" Provides integration with dash.app.  I mostly query dash directly
"Plugin 'rizzatti/dash.vim'
"Tries to handle ctrlp/ack.vim/buffer switching tasks, but lacks the attention
"to detail and documentation of those plugins
"Plugin 'Shougo/unite.vim'
"Plugin 'Shougo/vimproc.vim' "Unite dependency

"End Vundle
call vundle#end()
"Vundle ended so reenable filetypes
filetype plugin indent on
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"Pull in matchit.vim, which is already bundled with Vim
runtime! macros/matchit.vim


" Appearance
" ==========

colorscheme Tomorrow-Night-Bright 
"We want syntax highlighting in 256 colors
syntax on
syntax enable
set t_Co=256
" Use base-16 for the color scheme, different themes in GUI and terminal
set noshowmode                                  " Let airline handle the mode display

if has("gui_running")
  map <F1> :set invfu<CR>
  set guioptions-=egt
  set guioptions=LR
    set guioptions-=LR
    set antialias                     " MacVim: smooth fonts.
    set guioptions-=T                 " Hide toolbar.
    " set guioptions-=r                 " Don't show right scrollbar

  if has("unix")
    let s:uname = system("uname")
    if s:uname == "Darwin\n"
      set guifont=Inconsolata-g\ for\ Powerline
    else
      set guifont=Inconsolata-g\ for\ Powerline\ 14
    endif
  endif

endif

" General Config
" ==============

let mapleader='\'               " I just use the default Leader
set encoding=utf-8
set number                      " Line numbers are nice
set cursorline
set backspace=indent,eol,start  " Allow backspace in insert mode
set history=1000                " Store lots of :cmdline history
set showcmd                     " Show incomplete cmds down the bottom
set gcr=a:blinkon0              " Disable cursor blink
set autoread                    " Reload files changed outside vim
set laststatus=2                " Always show status line
set hidden                      " Buffers can exist in the background
set splitright                  " Opens vertical split right of current window
set splitbelow                  " Opens horizontal split below current window
set shortmess=filnxtToOI        " see :help shortmess
set showmatch
set lazyredraw

" Reduce escape delay in vim
set timeoutlen=1000 ttimeoutlen=0

" Mouse
" ======

" Send more characters for redraws
set ttyfast
" Enable mouse use in all modes
set mouse=a
" Set this to the name of your terminal that supports mouse codes.
" Must be one of: xterm, xterm2, netterm, dec, jsbterm, pterm
set ttymouse=xterm2


" Search Settings
" ===============

set incsearch        " Find the next match as we type the search
set hlsearch         " Highlight searches by default
set viminfo='100,f1  " Save up to 100 marks, enable capital marks

" Turn Off Swap Files
" ===================

set noswapfile
set nobackup
set nowritebackup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" Persistent Undo
" ===============

" Keep undo history across sessions, by storing in file
" Only works in MacVim (gui) mode
"if has('gui_running')
"  set undodir=~/.vim/backups
"  set undofile
"endif

" Indentation and Display
" =======================

" We want to replace tabs with spaces and have 2 space width indentation
set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

set list listchars=tab:\ \ ,trail:·   " Display tabs and trailing spaces visually
" set nowrap                            " Don't wrap lines

" Folds
" =====

set foldmethod=indent   " Fold based on indent
set foldnestmax=3       " Deepest fold is 3 levels
set nofoldenable        " Don't fold by default

" Completion
" ==========

"set wildmode=list:longest
set wildmode=longest,list,full
set wildmenu                    " Enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~     " Stuff to ignore when tab completing
set wildignore+=*vim/backups*

" Scrolling
" =========

" Start scrolling when we're getting close to margins
set scrolloff=10
set sidescrolloff=15
set sidescroll=1


" Custom commands
" ===============

"Let K be the opposite of J
map K i<Enter><Esc>
"\sv=> refresh vimrc
nnoremap <leader>sv :source ~/.vimrc<CR>

" Switch between the last two files
nnoremap <leader><leader> <c-^>

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" move vertically by visual line
nnoremap j gj
nnoremap k gk

" jk is escape
inoremap jk <esc>

" Edit another file in the same directory as the current file
" " uses expression to extract path from current file's path
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>e :e %%
map <leader>sp :sp %%
map <leader>vsp :vsp %%


" Plugin Options
" ==============

" CTRL+P options

let g:ctrlp_custom_ignore = {
    \ 'file': '\.pyc$',
    \ 'dir': 'node_modules\|\.DS_Store$\|\.git$'
    \ }
" Airline options
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

"Markdown options
"let g:vim_markdown_folding_disabled=1

"NerdTree Options
map <C-n> :NERDTreeToggle<CR>
let NERDTreeHijackNetrw=1 "Put Nerdtree into a window

"YouCompleteMe options
"let g:ycm_min_num_of_chars_for_completion=3

" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
