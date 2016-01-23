" Plugins 
" -----------
" load pathogen
execute pathogen#infect()

if has('autocmd')
  filetype plugin indent on
endif

if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif

set backspace=indent,eol,start
set complete-=i

" Mappings
" -------
" Set leader to the spacebar
let g:mapleader = " "

" UI
set relativenumber number " Hybrid mode, shows relative numbers with the current line being the actual number, rather than 0
set showmatch
set mat=2
set hid
set magic
set laststatus=2
set ruler
set showcmd
set cmdheight=1
set wildmenu
set cursorline
set background=dark
colorscheme gruvbox
set display+=lastline
set hidden
set clipboard=unnamed

set nrformats-=octal

set ttimeout
set ttimeoutlen=100

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase
" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

if !&scrolloff
  set scrolloff=1
endif

if !&sidescrolloff
  set sidescrolloff=5
endif

" Indenting
set autoindent
set smarttab expandtab
set softtabstop=2 shiftwidth=2 shiftround
set nofoldenable
set wrap
" Reselect visual block after indenting
" This makes it so you can't use the repeater . key
" vnoremap < <gv
" vnoremap > >gv

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Return to last edit position when opening files
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \ exe "normal! g`\"" |
  \ endif

" Don't use backup, since everything is in git
set nobackup nowb noswapfile

" Smart way to move between splits
nnoremap <silent> <C-j> <C-W>j
nnoremap <silent> <C-k> <C-W>k
nnoremap <silent> <C-h> <C-W>h
nnoremap <silent> <C-l> <C-W>l

" Set jsx to .js files
let g:jsx_ext_required=0

" Leader mappings
" ------------
" Close all buffers
map <leader>ba :1,1000 bd!<cr>

" Switch cwd to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Spell check
map <leader>ss :setlocal spell!<cr>

" Add semicolon to the end of the line while in insert mode
inoremap <leader>; <C-o>A;

" Set netrw to a tree style listing
let g:netrw_liststyle=3
map <leader>t :silent Vex<cr>

" Plugin mappings
" ------------
" Fugitive
nnoremap <leader>gc :Gcommit<cr>
nnoremap <leader>gd :Gdiff<bar>wincmd p<cr>
nnoremap <leader>gs :Gstatus<cr>

" Unite
nnoremap <leader>f :Unite -start-insert file_rec<cr>
nnoremap <leader>b :Unite buffer<cr>
nnoremap <leader>/ :Unite -start-insert line<cr>

" Plugin settings
" -------------
" Airline
let g:airline#extensions#tabline#enabled=1

if &encoding ==# 'latin1' && has('gui_running')
  set encoding=utf-8
endif

if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif

if v:version > 703 || v:version == 703 && has('patch541')
  set formatoptions+=j " Delete comment character when joining commented lines
endif

if has('path_extra')
  setglobal tags-=./tags tags-=./tags; tags^=./tags;
endif

if &shell =~# 'fish$'
  set shell=/bin/bash
endif

set autoread
set autowrite
set fileformats+=mac

if &history < 1000
  set history=1000
endif

if &tabpagemax < 50
  set tabpagemax=50
endif

if !empty(&viminfo)
  set viminfo^=!
endif

set sessionoptions-=options

" Allow color schemes to do bright colors without forcing bold.
if &t_Co == 8 && $TERM !~# '^linux'
  set t_Co=16
endif

" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

inoremap <C-U> <C-G>u<C-U>
