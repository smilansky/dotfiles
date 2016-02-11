" .vimrc
set nocompatible
filetype off   
" set the runtime path to include vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/vundle.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'raimondi/delimitmate'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-bundler'
Plugin 'https://github.com/kien/ctrlp.vim'
Plugin 'tpope/vim-vividchalk'
Plugin 'scrooloose/syntastic'
" Plugin 'wookiehangover/jshint.vim'
Plugin 'helino/vim-json'
Plugin 'tpope/vim-surround'  
Plugin 'ternjs/tern_for_vim'
Plugin 'kchmck/vim-coffee-script' 
call vundle#end()            
" to ignore plugin indent changes, instead use:
"
" brief help
" :pluginlist          - list configured plugins
" :plugininstall(!)    - install (update) plugins
" :pluginsearch(!) foo - search (or refresh cache first) for foo
" :pluginclean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for faq
" put your non-plugin stuff after this line

syntax on
set background=dark
colorscheme vividchalk 
set re=1 

set clipboard=unnamed
set encoding=utf-8
set fileformats=unix
set ff=unix
set nomodeline

set undodir^=~/.vimtemp/undo
set backupdir^=~/.vimtemp/backup
set directory^=~/.vimtemp/temp
set nobackup
set noswapfile


set showcmd
set wildmenu
set autoread
set autowrite
set ttyfast

"" searching
set incsearch
set ignorecase
set smartcase

filetype plugin indent on


set scrolloff=3
set nu
set expandtab
set tabstop=2
set shiftwidth=2
" explicitly set filetype to ruby
au bufread,bufnewfile {gemfile,rakefile,vagrantfile,thorfile,procfile,capfile,guardfile,config.ru,.railsrc,.irbrc,.pryrc} set ft=ruby

" 4 spaces for tab in python files
autocmd bufenter *.py setlocal softtabstop=4 shiftwidth=4

:nmap <c-s> :wa<cr>
:vmap <c-s> <esc><c-s>gv
:imap <c-s> <esc><c-s>
:map <c-j> <c-w>j<c-w>_
:map <c-k> <c-w>k<c-w>_
:map <c-c> <cr><esc>o

set runtimepath^=~/.vim/bundle/ctrlp.vim
map <c-a> <esc>ggvg<cr>

let g:netrw_localrmdir="rm -r"

"-----SYNTASTIC-------"
let g:syntastic_mode_map = { 'mode': 'active',
                            \ 'active_filetypes': ['python', 'javascript'],
                            \ 'passive_filetypes': [] }

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0 
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_coffee_checkers = ['coffeelint', 'coffee']

" add spell checking and automatic wrapping at 72 columns for commit messages
autocmd filetype gitcommit setlocal spell textwidth=72
