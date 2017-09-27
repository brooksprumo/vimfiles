filetype off
set nocompatible
set runtimepath+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'altercation/vim-colors-solarized'
Plugin 'cespare/vim-toml'
Plugin 'easymotion/vim-easymotion'
Plugin 'embear/vim-localvimrc'
Plugin 'godlygeek/tabular'
Plugin 'maxbrunsfeld/vim-yankstack'
Plugin 'rust-lang/rust.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'Shougo/denite.nvim'
Plugin 'sjl/gundo.vim'
Plugin 'taglist.vim'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-git'
Plugin 'tpope/vim-projectionist'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'wincent/command-t'
Plugin 'Xuyuanp/nerdtree-git-plugin'

call vundle#end()
filetype plugin indent on


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Identify the system
"
if has('win32') || has('win64')
	let s:os = 'windows'
elseif has('mac') || has('macunix')
	let s:os = 'mac'
elseif has ('unix') || has('win32unix')
	let s:os = 'unix'
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
"

" get out of vi-compatible mode
"
set nocompatible

" none of these should be word dividers, so make them not be
"
set iskeyword+=_,$,@,%,#

" set the title
"
set title

" ignore case sensitivity on search patterns
" ignore case sensitivity on search UNLESS using capital letters
"
set ignorecase
set smartcase

" show (and set) invisible characters
"
set listchars=tab:│⬞,trail:•,extends:❯,precedes:❮
set showbreak=↪\ " comment to make the space character evident
set list
set breakindent

" actual state of keyboard input
"
set showcmd

" syntax highlighting on
"
syntax on

" allow hidden buffers
"
set hidden

" command-line completion operates in an enhanced mode
"
set wildmenu

" Show the line and column number of the cursor position
"
set ruler

" Show the relative line number in front of each line
"
set number
set relativenumber

" set the vertical and horizontal scroll offset
"
set scrolloff=3
set sidescrolloff=3

" do not redraw while running macros (much faster)
"
set lazyredraw

" no visible nor audible bells
"
set noerrorbells
set novisualbell

" set the tag file location
"
set tags+=tags;./tags;../tags;../../tags

" set window splitting on the right
"
set splitright

" Turn off cursor blinking
"
set guicursor=a:blinkon0

" set colorscheme
"
colorscheme solarized
set background=dark
highlight SpecialKey guibg=#002b36

" Set the gui font
"
if s:os == 'windows'
	set guifont=Consolas:h10
elseif s:os == 'mac'
	set guifont=Menlo:h11
elseif s:os == 'unix'
	set guifont=Monospace\ 9
endif

if has("multi_byte")
	set encoding=utf-8
endif

" yank to/put from the system's clipboard
"
set clipboard=unnamed

" show matching brackets for a moment
"
set showmatch

" how many tenths of a second to blink matching brackets for
"
set matchtime=3

" highlight searched phrase and while typing the search phrase
"
set hlsearch
set incsearch

" always show the status line
"
set laststatus=2

" Number of screen lines to use for the command-line
"
set cmdheight=1

" indent settings
"
set autoindent
set smartindent
set cindent

" tab settings (tab inserts real tabs and viewed as four spaces)
"
set tabstop=4
set shiftwidth=4
set softtabstop=0
set noexpandtab
set nosmarttab

" Do not automatically insert comment leader when inserting with 'o' and 'O'
"
set formatoptions-=tco
set formatoptions+=rql

" do not wrap lines (but when we do, don't split words)
"
set nowrap
set linebreak

" Do not resize windows after splitting/closing a window
"
set noequalalways

" set <leader> *before* any mappings
"
let mapleader = "\<Space>"


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fugitive mappings and settings
"
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gr :Gread<CR>
nnoremap <leader>gw :Gwrite<CR>
nnoremap <leader>ge :Gedit<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gl :Glog<CR>
nnoremap <leader>gb :Gblame<CR>

" Map .. to go up a level when inspecting the git repository
"
autocmd User fugitive
	\ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
	\ nnoremap <buffer> .. :edit %:h<CR> |
	\ endif

" Autoclose fugitive buffers when they go inactive
"
autocmd BufReadPost fugitive://* set bufhidden=delete


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Gundo mappings and settings
"
nnoremap <silent> <leader>u :GundoToggle<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Nerd Tree mappings and settings
"
nnoremap <silent> <leader>nn :NERDTreeToggle<CR>
nnoremap <silent> <leader>nf :NERDTreeFind<CR>
nnoremap <silent> <leader>nc :NERDTreeCWD<CR>
nnoremap <silent> <leader>nm :NERDTreeMirror<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Nerd Commenter mappings and settings
"
let g:NERDSpaceDelims = 1
let g:NERDTrimTrailingWhitespace = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tag List mappings and settings
"
nnoremap <silent> <F8>      :TlistToggle<CR>
inoremap <silent> <F8> <ESC>:TlistToggle<CR>i


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Projectionist mappings and settings
"
let g:projectionist_heuristics =
	\ {
	\   '*.c|*.cc|*.cpp': { 'alternate': '{}.h' },
	\   '*.h':            { 'alternate': '{}.c' },
	\   '*.hh':           { 'alternate': '{}.cc' },
	\   '*.hpp':          { 'alternate': '{}.cpp' },
	\ }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Airline mappings and settings
"
let g:airline#extensions#tabline#enabled = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" YouCompleteMe mappings and settings
"
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_global_ycm_extra_conf = '~/git/vimfiles/ycm_extra_conf.py'
let g:ycm_key_detailed_diagnostics = '<leader>yd'
nnoremap <silent> <leader>yg :YcmCompleter GoTo<CR>
nnoremap <silent> <leader>yt :YcmCompleter GetType<CR>
nnoremap <silent> <leader>yo :YcmCompleter GetDoc<CR>
nnoremap <silent> <leader>yf :YcmCompleter FixIt<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" yankstack mappings and settings
"
let g:yankstack_map_keys = 0
nnoremap <silent> <leader>p <Plug>yankstack_substitute_older_paste
nnoremap <silent> <leader>P <Plug>yankstack_substitute_newer_paste
call yankstack#setup()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" localvimrc mappings and settings
"
let g:localvimrc_persistent = 2

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key Mappings
" See :help map-modes and :help key-mapping for more information
"

" Don't require holding shift to enter command/ex mode from normal/visual mode
"
nnoremap ; :
vnoremap ; :

" Jump to last opened buffer
" (can also use ctrl+6 or ctrl+^)
"
nnoremap <silent> <leader><Tab> :e #<CR>

" Remove trailing whitespace
"
nnoremap <silent> <leader>$ :call <SID>Preserve("%s/\\s\\+$//e")<CR>

" Toggle syntax highlighting
"
nnoremap <F6>      :set hlsearch!<CR>
inoremap <F6> <ESC>:set hlsearch!<CR>i

" Toggle show/hide hidden characters
"
nnoremap <F9>      :set list!<CR>
inoremap <F9> <ESC>:set list!<CR>i

" Insert the data and time
"
inoremap <leader>d<leader> <C-R>=strftime("%c")<CR>

" Redo syntax highlighting
"
nnoremap <F5>      :syntax sync fromstart<CR>
inoremap <F5> <ESC>:syntax sync fromstart<CR>i

" Search for visual/selected text
" 1. yank selected text into register h
" 2. set the search variable, @/, to register h which will perform the search without moving the cursor
" 3. turn on highlighting
"
vnoremap <silent> <leader>/ "hy:let @/='<C-R>h'<CR>:set hlsearch<CR>

" Double left mouse click will visually select and highlight/search word under cursor
"
nnoremap <silent> <2-LeftMouse> "hyiw:let @/='<C-R>h'<CR>:set hlsearch<CR>

" Open up vimrc
"
nnoremap <leader>v<leader> :edit $MYVIMRC<CR>

" Sort #includes
"
nnoremap <leader>si<leader> :/#include/,/^\w*$/-1 sort i<CR>

" bindings for movement between splits
"
nnoremap <silent> <c-h> :wincmd h<CR>
nnoremap <silent> <c-j> :wincmd j<CR>
nnoremap <silent> <c-k> :wincmd k<CR>
nnoremap <silent> <c-l> :wincmd l<CR>

" make Y yank until the end of the line
"
nnoremap Y y$

" Stuff to unmap
"
nnoremap K <nop>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Functions
"
function! <SID>Preserve(command)
	" Preparation: save last search, and cursor position.
	let _s=@/
	let l = line(".")
	let c = col(".")
	" Do the business:
	execute a:command
	" Clean up: restore previous search history, and cursor position
	let @/=_s
	call cursor(l, c)
endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tips and Help
"
" Tabs:
"   gt -- move to next tab
"   gT -- move to previous tab
"
" Movement:
"   Shift + Up/Down -- page up/down
"   Ctrl  + b/f     -- page up/down ('b' for 'back', 'f' for 'forward')
"   zl / zh         -- scroll screen N characters to the left/right
"
" Jumping:
"   gf / gF          -- goto file whose name is under (or after) the cursor
"   gd / gD          -- goto local/global declaration of variable under cursor
"   [# / ]#          -- goto prev/next unmatched #if/#else/#ifdef
"   [( / ]), [{ / ]} -- goto prev/next unmatched (,),{,}
"
" Random:
"   :qa[ll] -- exit vim unless there are modified buffers
"   ga / g8 -- get ascii/UTF-8 value of character under cursor
"   [I / ]I -- list all lines found in current + included files that contain the word under the cursor
"   [D / ]D -- list all #defines found in current + included files that contain the word under the cursor
