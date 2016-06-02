filetype off
set nocompatible
set runtimepath+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" github plugins
Plugin 'altercation/vim-colors-solarized'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'easymotion/vim-easymotion'
Plugin 'godlygeek/tabular'
Plugin 'rust-lang/rust.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'sjl/gundo.vim'
Plugin 'taglist.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-git'
Plugin 'tpope/vim-unimpaired'
Plugin 'wincent/command-t'
Plugin 'Valloric/YouCompleteMe'

" vimscript plugins
Plugin 'YankRing.vim'
Plugin 'a.vim'
call vundle#end()
filetype plugin indent on



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Identify the system
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has('win32') || has('win64')
	let s:os = 'windows'
elseif has('mac') || has('macunix')
	let s:os = 'mac'
elseif has ('unix') || has('win32unix')
	let s:os = 'unix'
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" get out of vi-compatible mode
"
set nocompatible

" save global variables that consists of upper case letters
"
set viminfo+=!

" none of these should be word dividers, so make them not be
"
set iskeyword+=_,$,@,%,#

" set the title
"
set title

" ignore case sensitivity on search patterns
"
set ignorecase

" but, enable smart-case searching
" if you search '/the' it will match The, THE, and the
" if you search '/The' it will only match The
"
set smartcase

" no show chars on end of line, white spaces, tabs, etc
"
set nolist

" actual state of keyboard input
"
set showcmd

" syntax highlighting on
"
syntax on

" allow hidden buffers
" hidden buffers are buffers with unsaved changes
"
set hidden

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim UI
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set background=dark

" command-line completion operates in an enhanced mode
"
set wildmenu

" Show the line and column number of the cursor position
"
set ruler

" Print the line number in front of each line
"
set number

" do not redraw while running macros (much faster) (LazyRedraw)
"
set lazyredraw

" allow cursor keys to cross line boundaries
"
set whichwrap+=<,>,h,l

" don't make noise on error messages
"
set noerrorbells

" don't blink
"
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


" GUI vs Console
"
if has("gui_running")
	set lines=50 columns=100
	set antialias
else
	set t_Co=16
endif
colorscheme solarized

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

" When showing extra characters via !list, use...
" >---- for tabs
" $$$$$ for extra whitespace
"
set listchars=tab:>-,trail:$


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Visual Cues
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" show matching brackets for a moment
"
set showmatch

" how many tenths of a second to blink matching brackets for
"
set matchtime=3

" highlight searched phrases
"
set hlsearch

" ...and highlight as you type you search phrase
"
set incsearch

" always show the status line
"
set laststatus=2

" Number of screen lines to use for the command-line
"
set cmdheight=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text Formatting/Layout
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" set text width to this value
"
set textwidth=0

" take indent for new line from previous line
"
set autoindent

" smart autoindenting for C programs
"
set smartindent

" do c-style indenting
"
set cindent

" Do not automatically insert comment leader when inserting with 'o' and 'O'
"
set formatoptions-=tco
set formatoptions+=rql

" do not wrap lines
"
set nowrap

" when wrapping, don't split words
"
set linebreak

" highlight trailing whitespace
"
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
if v:version >= 702
	autocmd BufWinLeave * call clearmatches()
endif

" set the color of vim folds
" While using the solarized colorscheme, there's not need to manually set the
" color of the vim folds, so this is commented out.
"
"highlight Folded guibg=black guifg=green

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tabs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set tabstop to tell vim how many columns a tab counts for.
" This is the only command here that will affect how existing text displays.
"
set tabstop=4

" Set softtabstop to control how many columns vim uses when you hit Tab in
" insert mode. If softtabstop is less than tabstop and expandtab is not set,
" vim will use a combination of tabs and spaces to make up the desired
" spacing. If softtabstop equals tabstop and expandtab is not set, vim will
" always use tabs. When expandtab is set, vim will always use the appropriate
" number of spaces.
"
set softtabstop=0

" Set shiftwidth to control how many columns text is indented with the reindent operations (<< and >>) and automatic C-style indentation.
"
set shiftwidth=4

" When expandtab is set, hitting Tab in insert mode will produce the appropriate number of spaces
"
set noexpandtab

" When on, a <Tab> in front of a line inserts blanks according to 'shiftwidth'.
" When off, a <Tab> always inserts blanks according to 'tabstop' or 'softtabstop'.
"
set nosmarttab

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Perl
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" highlight advanced perl vars inside strings
"
let perl_extended_vars = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fugitive mappings and settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gr :Gread<CR>
nnoremap <Leader>gw :Gwrite<CR>
nnoremap <Leader>ge :Gedit<CR>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gc :Gcommit<CR>
nnoremap <Leader>gl :Glog<CR>
nnoremap <Leader>gb :Gblame<CR>

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
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <Leader>u :GundoToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Nerd Tree mappings and settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <Leader>e :NERDTreeToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tag List mappings and settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <F8>      :TlistToggle<CR>
inoremap <silent> <F8> <ESC>:TlistToggle<CR>i

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Yank Ring mappings and settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap Y :<C-U>YRYankCount 'y$'<CR>
nnoremap <silent> <leader>y :YRShow<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Airline mappings and settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline#extensions#tabline#enabled = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Special arguments: <buffer>, <silent>, <special>, <script>, <expr> and <unique>
" <buffer> the mapping will be effective in the current buffer only. The local buffer mappings are used before the global ones.
" <silent> define a mapping which will not be echoed on the command line
" <script> the mapping will only remap characters in the {rhs} using mappings that were defined local to a script, starting with <SID>.
" <unique> if it is used to define a new mapping or abbreviation, the command will fail if the mapping or abbreviation already exists.
" <expr> the expression is evaluated to obtain the {rhs} that is used.

" There are five sets of mappings
" - For Normal mode: When typing commands.
" - For Visual mode: When typing commands while the Visual area is highlighted.
" - For Operator-pending mode: When an operator is pending (after "d", "y", "c", etc.).
" - For Insert mode.  These are also used in Replace mode.
" - For Command-line mode: When entering a ":" or "/" command.
" See :help map-modes and :help key-mapping for more information


" Don't require holding shift to enter command/ex mode from normal/visual mode
"
nnoremap ; :
vnoremap ; :

" Jump to last opened buffer
" (can also use ctrl+6 or ctrl+^)
"
nnoremap <silent> <Leader><Tab> :e #<CR>

" Use ctrl+tab to cycle through buffers
"
nnoremap <silent> <C-Tab>   :bnext<CR>
nnoremap <silent> <C-S-Tab> :bprevious<CR>

" Remove trailing whitespace
"
nnoremap <silent> <Leader>$ :call <SID>Preserve("%s/\\s\\+$//e")<CR>

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
inoremap <Leader>d<Leader> <C-R>=strftime("%c")<CR>

" Redo syntax highlighting
"
nnoremap <F5>      :syntax sync fromstart<CR>
inoremap <F5> <ESC>:syntax sync fromstart<CR>i

" Search for visual/selected text
" 1. yank selected text into register h
" 2. set the search variable, @/, to register h which will perform the search without moving the cursor
" 3. turn on highlighting
"
vnoremap <silent> <Leader>/ "hy:let @/='<C-R>h'<CR>:set hlsearch<CR>

" Double left mouse click will visually select and highlight/search word under cursor
"
nnoremap <silent> <2-LeftMouse> "hyiw:let @/='<C-R>h'<CR>:set hlsearch<CR>

" Open up vimrc
"
nnoremap <Leader>v<Leader> :edit $MYVIMRC<CR>

" Whenever we write to .vimrc, automatically source it!
" Currently commented out due to slowness when sourcing vimrc

"autocmd BufWritePost .vimrc source $MYVIMRC


" Use spacebar to toggle a fold
"
nnoremap <Space> za


" Sort #includes
"
nnoremap <Leader>si<Leader> :/#include/,/^\w*$/-1 sort i<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
"
