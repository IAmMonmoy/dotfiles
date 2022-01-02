set nocompatible 
set number
set relativenumber
syntax enable
set autoindent
set nobackup
set shell=fish
set incsearch
set noswapfile
set mouse=a
set spelllang=en
set spellsuggest=best,10

"set autochdir

" Don't redraw while executing macros (good performance config)
set lazyredraw
set ignorecase
set smarttab
filetype plugin indent on
set shiftwidth=4
set tabstop=4
set ai "Auto indent
set si "Smart indent
set nowrap "No Wrap lines
set backspace=start,eol,indent
" Finding files - Search down into subfolders
set path+=**
set wildignore=.git,*/node_modules/*,*/target/*,.metals,.bloop,.ammonite
" Turn off paste mode when leaving insert
autocmd InsertLeave * set nopaste
set formatoptions+=r

runtime ./plug.vim
runtime ./maps.vim
