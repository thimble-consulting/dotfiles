set mouse=a
set nocompatible              " be iMproved, required
filetype off                  " required

  " Language-specific things, TBD
  " Plugin 'pangloss/vim-javascript'
  " Plugin 'mxw/vim-jsx'
  " Plugin 'peitalin/vim-jsx-typescript'
  " Plugin 'neoclide/coc.nvim', {'branch': 'release'}
  " Plugin 'dart-lang/dart-vim-plugin'
  " Plugin 'numirias/semshi' " better python syntax

" Section: Basic VIM Setup
  " Remap leader key
  let mapleader=","

  " Make backspace work in insert mode
  set backspace=indent,eol,start

  " Display line numbers on the left
  set number
  " Put temp / swp files in specific place to keep local dir clean
  set directory=/tmp/

  " paste toggle
  nnoremap <leader>p :set invpaste paste?<CR>
  set pastetoggle=<leader>p
  set showmode

  set secure  " disable unsafe commands in local .vimrc files

" Section: Indentation
  set autoindent
  set shiftwidth=2
  set softtabstop=2
  set tabstop=2
  set expandtab

" Section: Colours!
  syntax enable

"" Map folding to L
  nmap <S-L> za


" Section: Search
  " Case insensitive search
  set ignorecase
  " Space bar gets rid of search
  nmap <space> :nohlsearch<CR>
  " Highlight matches
  set hlsearch

" Section: Whitespace
  " Display extra whitespace
  set list listchars=tab:»·,trail:·
  " Delete extra whitespace on save
  autocmd BufWritePre *.py :%s/\s\+$//e
  autocmd BufWritePre .vimrc :%s/\s\+$//e
  " unwanted whitespace removal/cleaning
  autocmd BufWritePre *.rb :%s/\s\+$//e
  autocmd BufWritePre *.ex :%s/\s\+$//e
  autocmd BufWritePre *.exs :%s/\s\+$//e
  autocmd BufWritePre *.py :%s/\s\+$//e
  autocmd BufWritePre *.php :%s/\s\+$//e
  autocmd BufWritePre *.haml :%s/\s\+$//e
  autocmd BufWritePre *.slim :%s/\s\+$//e
  autocmd BufWritePre *.js :%s/\s\+$//e
  autocmd BufWritePre *.jsx :%s/\s\+$//e
  autocmd BufWritePre *.coffee :%s/\s\+$//e
  autocmd BufWritePre *.feature :%s/\s\+$//e
  autocmd BufWritePre *.slimbars :%s/\s\+$//e

" Section: Turbux TDD - Keymaps for running tests
  " Specify Commands
  let test#filename_modifier = ":p"
  let test#strategy = "tslime"
  let g:tslime_always_current_session = 1
  let g:tslime_always_current_window = 1

  " Keymaps
  map <C-T> :TestFile<CR>    " t Ctrl+n
  map <C-F> :TestNearest<CR> " t Ctrl+f
  map <C-G> :TestSuite<CR>   " t Ctrl+s
  " There are many python test runners, and vim-test doesn't automatically
  " know which one to use
  let test#python#runner = 'pytest'


" Section: NerdTree - Project Sidebar
  " quit NERDTree after openning a file
  let NERDTreeQuitOnOpen=1
  let NERDTreeShowHidden=1
  let g:NERDTreeIgnore=['.bundle','.git$','node_modules']
  " Toggle NERDTree with <leader>,
  map <silent> <leader>. :execute 'NERDTreeToggle ' . getcwd()<CR>
  " Open current file in nerdtree
  nmap \| :execute 'NERDTreeFind'<CR>

" Section: Python
  filetype plugin on
  autocmd FileType python setlocal tabstop=4 softtabstop=4 shiftwidth=4 textwidth=80 smarttab expandtab

" Section: Neoformat / Prettier (js)
"   source: https://prettier.io/docs/en/vim.html
  let g:neoformat_try_node_exe = 1
  autocmd BufWritePre *.js Neoformat
  autocmd BufWritePre *.ts Neoformat
  autocmd BufWritePre *.jsx Neoformat
  autocmd BufWritePre *.tsx Neoformat


" Section: Lua
  autocmd FileType lua setlocal tabstop=2 softtabstop=2 shiftwidth=2 textwidth=80 smarttab expandtab

" Section: TMUX & System Clipboard
  set clipboard=unnamed
