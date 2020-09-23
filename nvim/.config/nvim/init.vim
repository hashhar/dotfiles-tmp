set nocompatible
filetype plugin indent on
syntax enable
set history=10000
set autoread
set autoindent smarttab
set hlsearch incsearch
set display-=truncate display+=lastline
set laststatus=2
set formatoptions=croqnj
set encoding=utf-8

" Persistent backup and recovery files {{{
set backup
set backupdir=$HOME/.config/nvim/files/backup/
set backupext=-vimbackup
set backupskip=
set undofile
set undodir=$HOME/.config/nvim/files/undo/
set directory=$HOME/.config/nvim/files/swap//
set updatecount=100

if exists('*mkdir') && !isdirectory($HOME.'/.config/nvim/files')
    call mkdir($HOME.'/.config/nvim/files')
endif
if exists('*mkdir') && !isdirectory($HOME.'/.config/nvim/files/backup')
    call mkdir($HOME.'/.config/nvim/files/backup')
endif
if exists('*mkdir') && !isdirectory($HOME.'/.config/nvim/files/swap')
    call mkdir($HOME.'/.config/nvim/files/swap')
endif
" }}}

set relativenumber number

" Smarter cursorline {{{
autocmd WinEnter * set cursorline
autocmd WinLeave * set nocursorline
" }}}

" vim: tw=80 fdm=marker et sts=4 ts=4 sts=4 sw=4
