" Select theme from vim-airline-themes
let g:airline_theme='light'

" Enable filetype detection
filetype on

" Enable plugins
filetype plugin on

" Load an indent file for detected file type
filetype indent on

" Turn syntax highlighting on
syntax on

" Turn number lines on by default
set number

" Use highlighting and show matching words during a search
set hlsearch
set showmatch

" Show mode in last ine
set showmode

" Enable autocompletion
set wildmenu
set wildmode=list:longest
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.exe,*.img,*.xlsx
