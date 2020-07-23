"  __  __        __     _____ __  __ ____   ____
" |  \/  |_   _  \ \   / /_ _|  \/  |  _ \ / ___|
" | |\/| | | | |  \ \ / / | || |\/| | |_) | |
" | |  | | |_| |   \ V /  | || |  | |  _ <| |___
" |_|  |_|\__, |    \_/  |___|_|  |_|_| \_\\____|
"         |___/


" ===
" === Auto load for first time uses
" ===
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" ===
" === Create a _machine_specific.vim file to adjust machine specific stuff, like python interpreter location
" ===
"let has_machine_specific_file = 1
"if empty(glob('~/.config/nvim/_machine_specific.vim'))
"	let has_machine_specific_file = 0
"	silent! exec "!cp ~/.config/nvim/default_configs/_machine_specific_default.vim ~/.config/nvim/_machine_specific.vim"
"endif
"source ~/.config/nvim/_machine_specific.vim

" ====================
" === Editor Setup ===
" ====================

" ===
" === Options
" ===

" 1 important
set nocompatible

" 2 moving around, searching and patterns
set ignorecase
set smartcase

" 3 tags

" 4 displaying text
set scrolloff=4
set wrap
set list
set listchars=tab:\|\ ,trail:▫
set number
set relativenumber

" 5 syntax, highlighting and spelling
set cursorline

" 6 multiple windows

" 7 multiple tab pages

" 8 terminal
set ttyfast "should make scrolling faster

" 9 using the mouse

" 10 printing

" 11 messages and info
set showcmd
set ruler

" 12 selecting text

" 13 editing text
set textwidth=0

" 14 tabs and indenting
set tabstop=2
set shiftwidth=2
set softtabstop=2
set noexpandtab
"set autoindent

" 15 folding
set foldenable

" 16 diff mode

" 17 mapping

" 18 reading and writing files

" 19 the swap file

" 20 command line editing
set wildmenu

" 21 executing external commands

" 22 running make and jumping to errors

" 23 language specific

" 24 multi-byte characters
set encoding=utf-8

" 25 various






"filetype on
"filetype indent on
"filetype plugin on
"filetype plugin indent on
"set mouse=a
"set clipboard=unnamed
"set clipboard=unnamedplus
" Prevent incorrect backgroung rendering
"let &t_ut=''
"set autochdir


" ===
" === Editor behavior
" ===
"set notimeout
"set ttimeoutlen=0
"set viewoptions=cursor,folds,slash,unix
"set textwidth=0
"set indentexpr=
"set foldmethod=indent
"set foldlevel=99
"set formatoptions-=tc
"set noshowmode
"set shortmess+=c
"set inccommand=split
"set completeopt=longest,noinsert,menuone,noselect,preview
"set lazyredraw "same as above
"set visualbell

"silent !mkdir -p ~/.config/nvim/tmp/backup
"silent !mkdir -p ~/.config/nvim/tmp/undo
""silent !mkdir -p ~/.config/nvim/tmp/sessions
"set backupdir=~/.config/nvim/tmp/backup,.
"set directory=~/.config/nvim/tmp/backup,.
"if has('persistent_undo')
"	set undofile
"	set undodir=~/.config/nvim/tmp/undo,.
"endif
"set colorcolumn=80
"set updatetime=1000
"set virtualedit=block

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif



" ===
" === Terminal Behaviors
" ===
"let g:neoterm_autoscroll = 1
"autocmd TermOpen term://* startinsert
tnoremap <C-N> <C-\><C-N>
tnoremap <C-O> <C-\><C-N><C-O>
let g:terminal_color_0  = '#000000'
let g:terminal_color_1  = '#FF5555'
let g:terminal_color_2  = '#50FA7B'
let g:terminal_color_3  = '#F1FA8C'
let g:terminal_color_4  = '#BD93F9'
let g:terminal_color_5  = '#FF79C6'
let g:terminal_color_6  = '#8BE9FD'
let g:terminal_color_7  = '#BFBFBF'
let g:terminal_color_8  = '#4D4D4D'
let g:terminal_color_9  = '#FF6E67'
let g:terminal_color_10 = '#5AF78E'
let g:terminal_color_11 = '#F4F99D'
let g:terminal_color_12 = '#CAA9FA'
let g:terminal_color_13 = '#FF92D0'
let g:terminal_color_14 = '#9AEDFE'




" ===
" === Basic Mappings
" ===

" Set <LEADER> as <SPACE>, ; as :
let mapleader=" "
noremap ; :

" Save & quit
noremap S :w<CR>
noremap Q :q<CR>
"noremap <C-q> :qa<CR>
inoremap kj <Esc>

" Replace the character under the cursor with {char}.
nnoremap 0 r


" Open the vimrc file anytime
noremap <LEADER>rc :e ~/.vim/vimrc<CR>

" Open Startify
"noremap <LEADER>st :Startify<CR>


" make Y to copy till the end of the line
nnoremap Y y$

" Copy to system clipboard
"vnoremap Y "+y

" Indentation
nnoremap < <<
nnoremap > >>

" Search
noremap <LEADER><CR> :nohlsearch<CR>

" Adjacent duplicate words
noremap <LEADER>dw /\(\<\w\+\>\)\_s*\1

" Space to Tab
"nnoremap <LEADER>tt :%s/    /\t/g
"vnoremap <LEADER>tt :s/    /\t/g

" Folding
"noremap <silent> <LEADER>o za

" Open up lazygit
"noremap \g :Git 
"noremap <c-g> :tabe<CR>:-tabmove<CR>:term lazygit<CR>


" ===
" === Cursor Movement
" ===
" Cursor movement (the default arrow keys are used for resizing windows)
"     ^
"     k
" < h   l >
"     j
"     v

" K/J keys for 5 times k/j (faster navigation)
noremap <silent> K 5k
noremap <silent> J 5j

" H key: go to the start of the line
noremap <silent> H 0
" L key: go to the end of the line
noremap <silent> L $

" Faster in-line navigation
noremap W 5w
noremap B 5b

" Ctrl + U or E will move up/down the view port without moving the cursor
"noremap <C-U> 5<C-y>
"noremap <C-E> 5<C-e>


" ===
" === Insert Mode Cursor Movement
" ===
inoremap <C-a> <ESC>A


" ===
" === Command Mode Cursor Movement
" ===
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
"cnoremap <M-b> <S-Left>
"cnoremap <M-w> <S-Right>


" ===
" === Window management
" ===
" Use <space> + new arrow keys for moving the cursor around windows
"noremap <LEADER>w <C-w>w
noremap <LEADER>k <C-w>k
noremap <LEADER>j <C-w>j
noremap <LEADER>h <C-w>h
noremap <LEADER>l <C-w>l

" Disable the default s key
noremap s <nop>

" Split the screens to up (horizontal), down (horizontal), left (vertical), right (vertical)
noremap sk :set nosplitbelow<CR>:split<CR>
noremap sj :set splitbelow<CR>:split<CR>
noremap sh :set nosplitright<CR>:vsplit<CR>
noremap sl :set splitright<CR>:vsplit<CR>

" Resize splits with arrow keys
noremap <up> :res +5<CR>
noremap <down> :res -5<CR>
noremap <left> :vertical resize-5<CR>
noremap <right> :vertical resize+5<CR>

" Place the two screens up and down
noremap sp <C-w>t<C-w>K
" Place the two screens side by side
noremap sv <C-w>t<C-w>H

" Rotate screens
noremap srp <C-w>b<C-w>K
noremap srv <C-w>b<C-w>H

" Press <SPACE> + q to close the window below the current window
noremap <LEADER>q <C-w>j:q<CR>


" ===
" === Tab management
" ===
" Create a new tab with tu
noremap tj :tabe<CR>
" Move around tabs with tn and ti
noremap th :-tabnext<CR>
noremap tl :+tabnext<CR>
" Move the tabs with tmn and tmi
noremap tmh :-tabmove<CR>
noremap tml :+tabmove<CR>

" ===
" === Markdown Settings
" ===
" Snippets
"source ~/.config/nvim/Ultisnipts/md-snippets.vim
"source ~/.config/nvim/Ultisnipts/vimwiki-snippets.vim
" auto spell
"autocmd BufRead,BufNewFile *.md setlocal spell


" ===
" === Other useful stuff
" ===
" Open a new instance of st with the cwd
nnoremap \t :tabe<CR>:-tabmove<CR>:term sh -c 'st'<CR><C-\><C-N>:q<CR>

" Move the next character to the end of the line with ctrl+9
"inoremap <C-u> <ESC>lx$p

" Opening a terminal window
noremap <LEADER>/ :set splitbelow<CR>:split<CR>:res +10<CR>:term<CR>

" Press space twice to jump to the next '<++>' and edit it
noremap <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4l

" Spelling Check with <space>sc
noremap <LEADER>sc :set spell!<CR>

" Press ` to change case (instead of ~)
"noremap ` ~

"noremap <C-c> zz

" 按 F2 进入粘贴模式
set pastetoggle=<F2>


" Auto change directory to current dir
"autocmd BufEnter * silent! lcd %:p:h

" Call figlet
noremap tx :r !figlet 

"noremap <LEADER>- :lN<CR>
"noremap <LEADER>= :lne<CR>

" find and replace
"noremap \s :%s//g<left><left>

" Compile function
noremap r :call CompileRunGcc()<CR>
function! CompileRunGcc()
	execute "w"
	if &filetype == 'c'
		if !isdirectory('build')
			execute "!mkdir build"
		endif
		execute "!gcc % -o build/%<"
		execute "!time ./build/%<"
	endif
endfunction




" Compile function
"noremap r :call CompileRunGcc()<CR>
"func! CompileRunGcc()
"	exec "w"
"	if &filetype == 'c'
"		exec "!g++ % -o %<"
"		exec "!time ./%<"
"	elseif &filetype == 'cpp'
"		set splitbelow
"		exec "!g++ -std=c++11 % -Wall -o %<"
"		:sp
"		:res -15
"		:term ./%<
"	elseif &filetype == 'java'
"		exec "!javac %"
"		exec "!time java %<"
"	elseif &filetype == 'sh'
"		:!time bash %
"	elseif &filetype == 'python'
"		set splitbelow
"		:sp
"		:term python3 %
"	elseif &filetype == 'html'
"		silent! exec "!".g:mkdp_browser." % &"
"	elseif &filetype == 'markdown'
"		exec "MarkdownPreview"
"	elseif &filetype == 'tex'
"		silent! exec "VimtexStop"
"		silent! exec "VimtexCompile"
"	elseif &filetype == 'dart'
"		CocCommand flutter.run
"	elseif &filetype == 'go'
"		set splitbelow
"		:sp
"		:term go run .
"	endif
"endfunc




" ===
" === Install Plugins with Vim-Plug
" ===

call plug#begin('~/.vim/plugged')

" 修改启动界面
Plug 'mhinz/vim-startify'
" 状态栏美化
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" 配色
Plug 'ajmwagar/vim-deus'
" 添加文件类型图标
" Plug 'ryanoasis/vim-devicons'

" Intellisense engine
"Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Markdown
"Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install_sync() }, 'for' :['markdown', 'vim-plug'] }


"Plug 'vimwiki/vimwiki'

" Editor Enhancement
"Plug 'preservim/nerdcommenter'

" Go
"Plug 'fatih/vim-go' , { 'for': ['go', 'vim-plug'], 'tag': '*' }
"Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
"Plug 'AndrewRadev/splitjoin.vim'

"Plug 'SirVer/ultisnips'

Plug 'kien/ctrlp.vim'


Plug 'tpope/vim-surround'  " type yskw' to wrap the word with '' or type cs'` to change 'word' to `word`

"Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }

call plug#end()




"  ____  _             _          ____             __ _
" |  _ \| |_   _  __ _(_)_ __    / ___|___  _ __  / _(_) __ _
" | |_) | | | | |/ _` | | '_ \  | |   / _ \| '_ \| |_| |/ _` |
" |  __/| | |_| | (_| | | | | | | |__| (_) | | | |  _| | (_| |
" |_|   |_|\__,_|\__, |_|_| |_|  \____\___/|_| |_|_| |_|\__, |
"                |___/                                  |___/



" ===
" === Dress up my vim
" ===
set termguicolors " enable true colors support

colorscheme deus
