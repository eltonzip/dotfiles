" Options
set nocompatible
set showcmd
set wildmenu

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

" Clipboard
if has('unnamedplus')
	set clipboard^=unnamedplus
endif

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

function! EltonzipGrep(num)
	if !a:num
		grep -rn <cword> --exclude={tags,Makefile,compile_commands.json,*.o}
	elseif a:num == 1
		grep -rn <cword> src/ --exclude={tags,Makefile,compile_commands.json,*.o}
	else
		grep <cword> %
	endif
endfunction

nnoremap <leader>mr :call EltonzipGrep(0)<cr>
nnoremap <leader>ms :call EltonzipGrep(1)<cr>
nnoremap <leader>mb :call EltonzipGrep(2)<cr>
