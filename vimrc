" Options
set nocompatible
set showcmd
set wildmenu
set viminfofile="NONE"
set scrolloff=0

set noswapfile
set nobackup

set autoindent
set smartindent

set incsearch
set ignorecase
set smartcase

set mouse=a

set path+=**

" Tabs
set noexpandtab
set smarttab
set shiftwidth=4
set tabstop=4

" Colors
set background=dark
syntax on

" Keymaps
let mapleader = " "
let maplocalleader = "\\"

nnoremap - :Explore<cr>

nnoremap <leader>ls :ls<cr>:b 

nnoremap <leader>ff :find 
nnoremap <leader>gg :grep 

nnoremap <silent> <C-j> :cnext<cr>
nnoremap <silent> <C-k> :cprevious<cr>
nnoremap <silent> <leader>co :copen<cr>
nnoremap <silent> <leader>cc :cclose<cr>

nnoremap <C-p> O<Esc>

nnoremap <leader>mp :set makeprg=
nnoremap <leader>mm :make<cr>

nnoremap <silent> <leader>ke :set keymap=""<cr>
nnoremap <silent> <leader>kr :set keymap=russian-jcukenwin<cr>

" C/C++ stuff
let c_syntax_for_h = 1

" Python stuff
function! EltonzipPythonAbbr()
	iabbrev Pmain if __name__ == "__main__":<esc>
endfunction

augroup python
	autocmd!
	autocmd FileType python call EltonzipPythonAbbr()
augroup END

" netrw
let g:netrw_banner = 0

" Grep
set grepprg=grep\ -Hn\ --exclude={tags,Makefile,build.sh,.gitignore}\ --exclude-dir={.cache,.git,vscode}

nnoremap <leader>ga :set grepprg=grep\ -Hn\ --exclude={tags,Makefile,build.sh,.gitignore}\ --exclude-dir={.cache,.git,vscode}<cr>
nnoremap <leader>gr :set grepprg=git\ grep\ -Hn<cr>

" Tabs again
function! EltonzipTabs(size)
	exec "set shiftwidth="..a:size
	exec "set tabstop="..a:size
endfunction

nnoremap <silent> <leader>tn :call EltonzipTabs(4)<cr>
nnoremap <silent> <leader>tb :call EltonzipTabs(8)<cr>
