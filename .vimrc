" Use Vim settings, rather then Vi settings. It’s important to have this on the top of your file, as it influences other options.
" be iMproved
set nocompatible

" ---------- Begin of Vundle section ----------
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'mileszs/ack.vim'
Plugin 'w0rp/ale'
Plugin 'junegunn/fzf', { 'dir': '/opt/homebrew/bin/fzf' }
Plugin 'junegunn/fzf.vim'
Plugin 'walm/jshint.vim'
Plugin 'tpope/vim-abolish'
" Plugin 'bling/vim-airline'
" Plugin 'vim-airline/vim-airline-themes'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-fugitive'
Plugin 'joom/vim-commentary'
Plugin 'tpope/vim-eunuch'
Plugin 'kana/vim-repeat'
Plugin 'vim-ruby/vim-ruby'
Plugin 'anyakichi/vim-surround'
Plugin 'dhruvasagar/vim-table-mode'
Plugin 'kana/vim-textobj-entire'
Plugin 'kana/vim-textobj-user'
Plugin 'tpope/vim-unimpaired'
Plugin 'nelstrom/vim-visual-star-search'
Plugin 'othree/html5.vim'
Plugin 'delimitMate.vim'
Plugin 'endwise.vim'
Plugin 'othree/xml.vim'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'ctrlpvim/ctrlp.vim'
" Plugin 'itchyny/lightline.vim'
Plugin 'tpope/vim-vinegar'
Plugin 'godlygeek/tabular'

" All of your Plugins must be added before the following line
" required
call vundle#end()

" required
filetype plugin indent on
" ---------- End of Vundle section ----------

" runtime macros/matchit.vim

"call pathogen#infect()

let mapleader = "\<Space>"

" Enable syntax highlighting.
syntax enable

" Show line numbers on the sidebar.
set number

" Show line number on the current line and relative numbers on all other
" lines. Works only if the option above (number) is enabled.
set relativenumber

" Ignore case when searching.
set ignorecase

" Unless you type a capital.
set smartcase

" Find the next match as we type the search.
set incsearch

" Highlight searches by default.
set hlsearch

" New lines inherit the indentation of previous lines.
set autoindent

" Smart auto indentation (instead of old smartindent option).
filetype plugin indent on

" Show existing tab with 2 spaces width.
set tabstop=2
set softtabstop=2

" When indenting with ‘>’, use 2 spaces width.
set shiftwidth=2

" On pressing tab, insert 2 spaces.
set expandtab

" Enable folding
" set foldenable

" Folds can be nested. Setting a max value protects you from too many folds
" set foldnestmax=10

" Open most of the folds by default. If set to 0, all folds will be closed.
" set foldlevelstart=10

" Defines the type of folding
" set foldmethod=syntax

" Perl
" let perl_fold=1

" Fold blocks in if statements, etc. in Perl
" let perl_fold_blocks = 1

" sh - enable function folding
" let sh_fold_enabled=1

" Vim script
" let vimsyn_folding='af'

" R
" let r_syntax_folding=1

" Ruby
" let ruby_fold=1

" PHP
" let php_folding=1

" JavaScript
" let javaScript_fold=1

" XML
" let xml_syntax_folding=1

" Show a small column on the left side of the window, beside line numbers, to
" visually indicate folds
" set foldcolumn=2

" keep your folds persistent through Vim sessions
"augroup auto_save_folds
"autocmd!
"autocmd BufWinLeave * mkview
"autocmd BufWinEnter * silent loadview

set fileencoding=utf-8

" Use an encoding that supports Unicode.
set encoding=utf-8

" Allow backspacing over indention, line breaks and insertion start.
set backspace=indent,eol,start

" Set bigger history of executed commands.
set history=1000

" Show incomplete commands at the bottom.
set showcmd

" Show current mode at the bottom.
set showmode

" Set gdefault
set showmatch

" Swap and backup file options - disable all of them.
" set noswapfile

" The directory option contains a list of directories where Vim will try to
" store swap files. The // at the end tells Vim to use the absolute path to
" the file to create the swap file. This will ensure that swap file name is
" unique, so there are no collisions between files with the same name from
" different directories.
set directory=$HOME/.vim/swapdir//

" Disable backup files.
set nobackup

" Organize backup files.
"set backupdir=~/.vim/.backup//

set nowb

" Flash the screen instead of beeping on errors.
set visualbell

" Highlight the line currently under cursor.
set cursorline
"set cc=80

" Enable true color
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  " set termguicolors
endif

" Use colors that suit a dark background.
set background=dark

" Change color scheme.
colorscheme solarized

".ru files are Ruby
au BufRead,BufNewFile *.ru setfiletype ruby

" Interpret octal as decimal when incrementing numbers.
"set nrformats-=octal
set nrformats=

set wildmode=full

" Display command line’s tab complete options as a menu.
set wildmenu

nnoremap <silent> [b :bprevious
nnoremap <silent> ]b :bnext
nnoremap <silent> [B :bfirst
nnoremap <silent> ]B :blast

" Manage multiple buffers effectively: the current buffer can be “sent” to the
" background without writing to disk. When a background buffer becomes current
" again, marks and undo-history are remembered.
set hidden

cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

"remove these remaps after you get into the habit of using h, j, k, and l.
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

set pastetoggle=<f5>

nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>

"make & acts like :&& in Normal and Visual modes (preserving any previously used flags)
nnoremap & :&&<CR>
xnoremap & :&&<CR>

"run ctags reindexing on every buffer save
nnoremap BufWritePost * call system("ctags -R")

" Make the airline status bar to always appear
set laststatus=2

" Set status line.
"set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\

" A different way of setting it could be something like:
"set statusline=%t       "tail of the filename
"set statusline+=%{&ff}] "file format
"set statusline+=%h "help file flag
"set statusline+=%m "modified flag
"set statusline+=%r "read only flag
"set statusline+=%y "filetype
"set statusline+=%c, "cursor column
"set statusline+=%l/%L "cursor line/total lines
"set statusline+=\ %P "percent through file

" Automatically populate the g:airline_symbols dictionary with the powerline symbols
let g:airline_powerline_fonts = 1

let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'

" Toggle autoindent on paste
set pastetoggle=<F3>

" Enable fzf plugin fuzzy search
set rtp+=/opt/homebrew/bin/fzf
nmap ~ :Buffers<CR>
nmap <Leader>f :Files<CR>
nmap <Leader>r :Tags<CR>
nmap <Leader>g :Ag<CR>

" Enable ctrlp.vim plugin
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" Make buffer cycling much more effective
map <C-K> :bprev<CR>
map <C-J> :bnext<CR>

nmap \x :cclose<CR>

" Maintain undo history between sessions
set undofile
set undodir=~/.vim/undodir

" Set file explorer view style
let g:netrw_liststyle = 0

" Open files in previous window (the current split you have beside netrw split)
let g:netrw_browse_split = 4

" Set the width of netrw split to 20% of your entire Vim window
let g:netrw_winsize = 20

" Disable cursor blink.
"set gcr=a:blinkon0

" Automatically re-read files if unmodified inside Vim.
"set autoread

" Always show cursor position.
"set ruler

" Maximum number of tab pages that can be opened from the command line.
set tabpagemax=40

" Disable beep on errors.
set noerrorbells

" Enable mouse for scrolling, resizing, and selection.
"set mouse=a

" Set the window’s title, reflecting the file currently being edited.
"set title

" Don’t wrap lines.
"set nowrap

" Wrap lines at convenient points, avoid wrapping a line in the middle of a word.
set linebreak

" The number of screen lines to keep above and below the cursor.
set scrolloff=0

" The number of screen columns to keep to the left and right of the cursor.
set sidescrolloff=0

" Display a confirmation dialog when closing an unsaved file.
"set confirm

" Ignore file’s mode lines; use vimrc configurations instead.
"set nomodeline

" The shell used to execute commands.
"set shell=/bin/bash

" Enable spellchecking.
"set spell

" enable project speficific vimrc
"set exrc

" Show your next matched string at the center of the screen when you press n or
" N, so it is easier to identify your location in the file
"nnoremap n nzz
"nnoremap N Nzz

" More smooth switching windows
"nnoremap <C-H> <C-W><C-H>
"nnoremap <C-J> <C-W><C-J>
"nnoremap <C-K> <C-W><C-K>
"nnoremap <C-L> <C-W><C-L>

" make . to work with visually selected lines
vnoremap . :normal.<CR>

" move visual selection
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Do not redraw the screen with each macro execution, this speeds up macro
" execution (useful when you execute macro on a large file - thousands of lines)
set lazyredraw

" enable relative numbers only in Normal mode, and absolute numbers only in Insert mode
augroup toggle_relative_number
autocmd InsertEnter * :setlocal norelativenumber
autocmd InsertLeave * :setlocal relativenumber

" shortcut for :w
nnoremap <Leader>w :w<CR>
nnoremap <Leader>s :source ~/.vimrc<CR>

nnoremap <Leader>d :bd<CR>

" autoload predefined template every time you create a new .html file
augroup templates
  au!
  " read in template files
  autocmd BufNewFile *.* silent! execute '0r $HOME/.vim/templates/skeleton.'.expand("<afile>:e")
augroup END

" highlight trailing whitespace
match ErrorMsg '\s\+$'

" remove trailing whitespaces automatically
autocmd BufWritePre * :%s/\s\+$//e
nnoremap <Leader>x :%s/\s\+$//e

" status bar config from
" https://stackoverflow.com/questions/9065941/how-can-i-change-vim-status-line-color
function! InsertStatuslineColor(mode)
  if a:mode == 'i'
    hi statusline ctermfg=32 ctermbg=0
  elseif a:mode == 'r'
    hi statusline ctermfg=13 ctermbg=0
  else
    hi statusline ctermfg=44 ctermbg=0
  endif
endfunction

au InsertEnter * call InsertStatuslineColor(v:insertmode)
au InsertLeave * hi statusline term=reverse cterm=reverse ctermfg=14 ctermbg=0 gui=bold,reverse
vnoremap <silent> <expr> <SID>hi statusline ctermfg=13 ctermbg=0

" default the statusline to green when entering Vim
hi statusline term=reverse cterm=reverse ctermfg=14 ctermbg=0 gui=bold,reverse

" Formats the statusline
" set statusline=%f   " file name
" set statusline+=\ %{FugitiveStatusline()}     " file name

" set statusline+=\ %=                        " align left
" set statusline+=Line:\ %l/%L[%p%%]          " line X of Y [percent of file]

" set statusline=\ %<%f\ %h%m%r%{FugitiveStatusline()}%=%-14.(%l/%L,%c%V%)\%p%%\%{nr2char(0x00A0)}
set statusline=%<%f\ %h%m%r%{FugitiveStatusline()}%=%-14.(%l/%L,%c%V%)\%p%%

" hide current mode text name
" set noshowmode
