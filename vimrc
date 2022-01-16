" ====================
" === Editor Setup ===
" ====================

" ===
" === Options
" ===

set nocompatible
set ignorecase
set smartcase
set scrolloff=4
set list
"set listchars=tab:\┆\ ,trail:▫
"set listchars=tab:\┇\ ,trail:▫
"set listchars=tab:\┊\ ,trail:▫
"set listchars=tab:\┋\ ,trail:▫
set listchars=tab:\⋮\ ,trail:▫
"set listchars=tab:\¦\ ,trail:▫
"set listchars=tab:\|\ ,trail:▫
"set listchars=tab:\│\ ,trail:▫
"set listchars=tab:\┃\ ,trail:▫
"set number
"set relativenumber
set cursorline
set showcmd
set ruler
set wildmenu
set nowrap
set ttyfast "should make scrolling faster
set textwidth=0
set tabstop=4
set shiftwidth=4
set softtabstop=4
set noexpandtab
"set autoindent
set foldenable

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" ===
" === Basic Mappings
" ===

" Set <Leader> as <Space>
let mapleader = " "

" Let ; map to :
noremap ; :

" Disable the default s key
noremap s <Nop>

" Save & Quit
nnoremap S :w<CR>
nnoremap Q :q<CR>
inoremap kj <Esc>

" Open the vimrc file anytime
nnoremap <Leader>rc :e ~/.vim/vimrc<CR>

" ===
" === Cursor Movement
" ===
"     ↑
"     k
" ← h   l →
"     j
"     ↓

" K/J keys for 5 times k/j (faster navigation)
noremap <silent> K 5k
noremap <silent> J 5j
" H key: go to the start of the line
noremap <silent> H 0
" L key: go to the end of the line
noremap <silent> L $
nnoremap <expr> ss col(".") == 1 ? "$" : "0"
vnoremap <expr> ss col(".") == 1 ? "$h" : "0"

" ===
" === Insert Mode Cursor Movement
" ===
noremap! <C-a> <Home>
noremap! <C-e> <End>
noremap! <C-p> <Up>
noremap! <C-n> <Down>
noremap! <C-b> <Left>
noremap! <C-f> <Right>

