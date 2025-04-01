" Options
set nocompatible
set showcmd
set wildmenu

set noswapfile
set nobackup

set autoindent
set smartindent

set hlsearch
set incsearch
set ignorecase
set smartcase

set mouse=a

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
syntax on

" Keymaps
let mapleader = " "
let maplocalleader = "\\"

nnoremap - :edit .<cr>

nnoremap <leader>ls :ls<cr>:b 

nnoremap <silent> <C-j> :cnext<cr>
nnoremap <silent> <C-k> :cprevious<cr>

nnoremap <silent> <C-l> :nohl<cr><C-l>

nnoremap <C-p> O<Esc>

nnoremap <leader>mp :set makeprg=
nnoremap <leader>mm :execute "make"<cr>

nnoremap <silent> <leader>ke :set keymap=""<cr>
nnoremap <silent> <leader>kr :set keymap=russian-jcukenwin<cr>

set path+=**
nnoremap <leader>ff :find ./

nnoremap <silent> <leader>mz :call EltonzipFind(0)<cr>
nnoremap <silent> <leader>mf :call EltonzipFind(1)<cr>

nnoremap <silent> <leader>fl <C-w><C-n><Esc>:.!find -type f<cr>

" C/C++ stuff
let c_syntax_for_h = 1

function! EltonzipCAbbr()
	iabbrev Cmain int main(int argc, char *argv[])<cr>{<cr>}<esc>k
	iabbrev Cdowhile do {<cr>} while ();<esc>F(
	iabbrev Cif if () {<cr>}<esc>kf(
	iabbrev Cfor for () {<cr>}<esc>kf(
endfunction

augroup ccpp
	autocmd!
	autocmd FileType c,cpp call EltonzipCAbbr()
augroup END

" Python stuff
function! EltonzipPythonAbbr()
	iabbrev Pmain if __name__ == "__main__":<esc>
endfunction

augroup python
	autocmd!
	autocmd FileType python call EltonzipPythonAbbr()
augroup END

" Bash stuff
function! EltonzipBashAbbr()
	iabbrev Bif if [[  ]]; then<cr>fi<Esc><<kf[ll
	iabbrev Belif elif [  ]; then<Esc>F]hh
endfunction

augroup shell
	autocmd!
	autocmd FileType sh call EltonzipBashAbbr()
augroup END

" netrw
let g:netrw_banner = 0

" Grep
set grepprg=grep\ -Hn

function! EltonzipGrep(num)
	if !a:num
		grep -r <cword> --exclude={tags,Makefile,compile_commands.json,*.o}
	elseif a:num == 1
		grep -r <cword> src --exclude={tags,Makefile,compile_commands.json,*.o}
	else
		grep <cword> %
	endif
endfunction

nnoremap <leader>mr :call EltonzipGrep(0)<cr>
nnoremap <leader>ms :call EltonzipGrep(1)<cr>
nnoremap <leader>mb :call EltonzipGrep(2)<cr>
