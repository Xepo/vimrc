set nocompatible

let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_map = '<NOP>'
let g:airline#extensions#whitespace#enabled = 0

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'vim-scripts/bufmru.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'godlygeek/tabular'
Bundle 'tpope/vim-surround'
Bundle 'chriskempson/base16-vim'
Bundle 'ervandew/supertab'
Bundle 'kshenoy/vim-signature'
Bundle 'bling/vim-airline'
Bundle 'kana/vim-arpeggio'
Bundle 'kana/vim-altr'

set laststatus=2
set dir=~/.vim_swapfiles
set backupdir=~/.vim_bufiles
set undodir=~/.vim_undofiles
set undofile

call altr#define('%.ml', '%.mli')
call arpeggio#map('n', '', 0, 'jo', ':CtrlP<CR>')
call arpeggio#map('n', '', 0, 'gh', ':call altr#forward()<CR>')

if has("gui_running")
	colo evening
endif

:map <F1> <NOP>
set ruler
set backspace=indent,eol,start
set autoindent
set smarttab
set shiftround
set nojoinspaces
set smartindent
set cindent
set shiftwidth=2 
set softtabstop=2 
set tabstop=2
set noexpandtab

set cmdheight=2
set grepprg=internal

set cursorline
set listchars+=precedes:<,extends:>
set showbreak===>
set history=1000
set hlsearch
set incsearch
set showmatch

"Ignore these extensions when looking at files
set suffixes+=.cmx,.o,.cmi

" Switch to the first window or tab that contains the open file
" instead of duplicating an open window if possible.  Open a new
" tab page if the buffer is not currently open
set switchbuf=useopen

"Abbreviate most messages
:set shortmess=aAt

"Prevents '=' from being treated as part of a filename
:set isfname-==

:let g:pyflakes_use_quickfix=0

"Mouse behavior
:behave xterm

highlight StatusLine guibg=black guifg=pink ctermfg=black ctermbg=green cterm=NONE
highlight StatusLineNC guibg=black guifg=lightblue ctermfg=black ctermbg=green cterm=NONE

:command! Pytags :!c:\progra~1\ctags\ctags.exe -R --language=python %:p:h/*.py %:p:h/**/*.py
:command! -nargs=* Xxd :%!c:\Progra~1\Vim\Vim73\xxd.exe <args>

filetype plugin indent on
syntax on

function MapDash()
	inoremap - _
	inoremap _ -
	inoremap -. ->
	inoremap -> ->
endfunction
command MapDash call MapDash()

let g:ctrlp_user_command = 'find %s -type f'

"Mappings
vmap < <gv
vmap > >gv

nnoremap <CR> :w<CR>

map <C-j> <PageDown>
map <C-k> <PageUp>

map <F9> <c-w>w<c-w>_
map <S-F9> <c-w>W<c-w>_

map <F4> :cn<CR>
map <S-F4> :cp<CR>
map <M-F4> :cope<CR>

map	<Up>	<C-w>k
map	<Down>	<C-w>j
map	<Left>	<C-w>h
map	<Right>	<C-w>l
map	<C-Up>	<C-w>k<C-w>_
map	<C-Down>	<C-w>j<C-w>_
map	<C-Left>	<C-w>h<C-w>_
map	<C-Right>	<C-w>l<C-w>_

map ,,b :Tabularize /^[^:]*\zs:/<CR>:Tabularize /^[^-]*[^>]*\zs->/<CR>:Tabularize /=/<CR>
"Hopefully not necessary because of supertab
":imap <Tab> <C-n>
":imap <S-Tab> <C-p>
