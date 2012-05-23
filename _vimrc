set nocompatible
filetype off

set rtp+=~/.vim/vundle.git/
call vundle#rc()
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/unite.vim'
Bundle 'thinca/vim-ref'
Bundle 'thinca/vim-quickrun'

Bundle 'vim-ruby/vim-ruby'

filetype plugin indent on

syntax on

set tabstop=2
set shiftwidth=2
set expandtab

" neocomplcache
let g:neocomplcache_enable_at_startup = 1

