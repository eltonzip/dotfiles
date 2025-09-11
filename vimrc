" Options
set nocompatible
set showcmd
set wildmenu
set viminfofile="NONE"
set scrolloff=0
set mouse=a

set noswapfile
set nobackup

set autoindent
set smartindent

set incsearch
set ignorecase
set smartcase
set hlsearch

set path+=**

" Tabs
set noexpandtab
set smarttab
set shiftwidth=4
set tabstop=4

" Colors
syntax on
set background=dark

" Gvim
if has('gui_running')
	set guioptions-=T "toolbar
endif

" Keymaps
let mapleader = " "
let maplocalleader = "\\"

nnoremap - :Explore<cr>

nnoremap viq vi"
vnoremap iq i"
nnoremap ciq ci"
nnoremap viq vi'
vnoremap iq i'
nnoremap ciq ci'

nnoremap <silent> <C-l> :noh<cr><C-l>

nnoremap <leader>ls :ls<cr>:b 

nnoremap <silent> <C-j> :cnext<cr>
nnoremap <silent> <C-k> :cprevious<cr>

nnoremap <silent> <C-p> O<Esc>

nnoremap <leader>mp :set makeprg=

nnoremap <silent> <leader>ke :set keymap=""<cr>
nnoremap <silent> <leader>kr :set keymap=russian-jcukenwin<cr>

" C/C++ stuff
let c_syntax_for_h = 1
function! EltonzipCCPPFindFunction()
	let l:fun_name = input("Function's name: ")
	execute "grep -rI '^'" . l:fun_name
endfunction

function! EltonzipCCPPFindMacro()
	let l:macro_name = input("Macro's name: ")
	execute "grep -rI 'define '" . l:macro_name
endfunction

augroup EZ_CCPP
	autocmd!
	autocmd FileType c,cpp nnoremap <leader>cf :call EltonzipCCPPFindFunction()<cr>
	autocmd FileType c,cpp nnoremap <leader>cm :call EltonzipCCPPFindMacro()<cr>
augroup END

" Python stuff
augroup EZ_PYTHON
	autocmd!
	autocmd FileType python iabbrev Pmain if __name__ == "__main__":<esc>
augroup END

" netrw
let g:netrw_banner = 0

" Grep
set grepprg=grep\ -IHn\ --exclude={tags,Makefile,build.sh,.gitignore}\ --exclude-dir={.cache,.git,vscode}

nnoremap <leader>ga :set grepprg=grep\ -IHn\ --exclude={tags,Makefile,build.sh,.gitignore}\ --exclude-dir={.cache,.git,vscode}<cr>
nnoremap <leader>gr :set grepprg=git\ grep\ -IHn<cr>
