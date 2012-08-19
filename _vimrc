set nocompatible
filetype off

set rtp+=~/.vim/vundle.git/
call vundle#rc()
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/unite.vim'
Bundle 'Shougo/vimfiler'
Bundle 'Shougo/vimproc'
Bundle 'Shougo/vimshell'
Bundle 'thinca/vim-ref'
Bundle 'thinca/vim-quickrun'
Bundle 'tyru/caw.vim'
Bundle 'Lokaltog/vim-powerline'
Bundle 'minibufexpl.vim'
Bundle 'SrcExpl'
Bundle 'trinity.vim'
Bundle 'The-NERD-tree'
Bundle 'taglist.vim'

Bundle 'desert256.vim'
Bundle 'yuroyoro/yuroyoro256.vim'
Bundle 'mrkn256.vim'

Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-rails'
Bundle 'JavaScript-syntax'
Bundle 'pangloss/vim-javascript'
Bundle 'kchmck/vim-coffee-script'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'yuroyoro/vim-scala'

Bundle 'othree/html5.vim'
Bundle 'hail2u/vim-css3-syntax'

Bundle 'scrooloose/syntastic'

Bundle 'tpope/vim-fugitive'

filetype plugin indent on

syntax on

set tabstop=2
set shiftwidth=2
set expandtab
set showmatch

set hlsearch
set incsearch
set ignorecase
set smartcase
nmap <ESC><ESC> :nohlsearch<CR><ESC>

set list
set listchars=tab:>-,extends:<,eol:\ ,trail:-

set laststatus=2
set number

set imdisable

"set splitright
"set splitbelow

" backup
set backup
set backupdir=~/.vim/backup
set swapfile
set directory=~/.vim/swap

" cursor
set cursorline
augroup cch
  autocmd! cch
  autocmd WinLeave * set nocursorline
  autocmd WinEnter,BufRead * set cursorline
augroup END
hi clear CursorLine
hi CursorLine gui=underline
highlight CursorLine ctermbg=black guibg=black

" color
colorscheme mrkn256
set t_Co=256
set t_Sf=[3%dm
set t_Sb=[4%dm

" neocomplcache
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_min_syntax_length = 3

" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
"autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'

" indent guide
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#121212 ctermbg=233
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#262626 ctermbg=235

autocmd BufRead *_spec.rb syn keyword rubyRspec describe context it specify it_should_behave_like before after setup subject its shared_examples_for shared_context let
highlight def link rubyRspec Function

" minibufexpl.vim
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplSplitBelow = 1
let g:miniBufExplModSelTarget = 1

" Unite
nnoremap    [unite]   <Nop>
nmap    f [unite]

" 分割しないでuniteのbufferを表示する
nnoremap [unite]u  :<C-u>Unite -no-split<Space>

" 全部乗せ
nnoremap <silent> [unite]a  :<C-u>UniteWithCurrentDir -no-split -buffer-name=files buffer file_mru bookmark file<CR>
" ファイル一覧
nnoremap <silent> [unite]f  :<C-u>Unite -no-split -buffer-name=files file<CR>
" バッファ一覧
nnoremap <silent> [unite]b  :<C-u>Unite -no-split buffer<CR>
" 常用セット
nnoremap <silent> [unite]u  :<C-u>Unite -no-split buffer file_mru<CR>
" 最近使用したファイル一覧
nnoremap <silent> [unite]m  :<C-u>Unite -no-split file_mru<CR>
" 現在のバッファのカレントディレクトリからファイル一覧
nnoremap <silent> [unite]d  :<C-u>UniteWithBufferDir -no-split file<CR>
