" Options
set nocompatible

set noswapfile
set nobackup

set autoindent

set hlsearch
set incsearch
set ignorecase

" Tabs
set noexpandtab
set smarttab
set shiftwidth=4
set tabstop=4

" Colors
syntax on
colorscheme evening

" Keymaps
let mapleader = " "
let maplocalleader = "\\"

nnoremap - :Explore<cr>

if executable('fzf')
	nnoremap <leader>ff :FZF -e --walker=file,dir<cr>
else
	set path+=**
	nnoremap <leader>ff :find 
endif

nnoremap <leader>ls :ls<cr>:b 

nnoremap <C-j> :cnext<cr>
nnoremap <C-k> :cprevious<cr>

nnoremap <silent> <C-l> :nohl<cr><C-l>

" C/C++ stuff
let c_syntax_for_h = 1

function! EltonzipCAbbr()
	iabbrev Cmain int main(int argc, char *argv[])<cr>{<cr>}<esc>k
	iabbrev Cswitch switch () {<cr>}<esc>kf)h
	iabbrev Cif if () {<cr>}<esc>kf)h
	iabbrev Celse else {<cr>}<esc>k$
	iabbrev Celseif else if () {<cr>}<esc>kf)h
	iabbrev Cwhile while () {<cr>}<esc>kf)h
	iabbrev Cdwhile do {<cr>} while ()<esc>h
	iabbrev Cfor for () {<cr>}<esc>kf)h
endfunction

augroup ccpp
	autocmd!
	autocmd FileType c,cpp call EltonzipCAbbr()
augroup END

" Python stuff
function! EltonzipPythonAbbr()
	iabbrev Pdef def ():<esc>hhh
endfunction

augroup python
	autocmd!
	autocmd FileType python call EltonzipPythonAbbr()
augroup END

" Statusline
set laststatus=2
set statusline=%y\ %20F\ %m\ %6l

" netrw
let g:netrw_banner = 0

" Grep
if executable('rg')
	set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
else
	set grepprg=grep\ -rn
endif

function! EltonzipGrepPrompt()
	let pattern = input('Pattern: ')

	if pattern == expand("<Esc>") || pattern == expand("<cr>")
		return 0
	endif

	execute "grep ".pattern
	copen
endfunction

function! EltonzipGrep(num)
	if !a:num
		grep <cword>
	else
		grep <cword> src/
	endif

	copen
endfunction

nnoremap <leader>rp :call EltonzipGrepPrompt()<cr>
nnoremap <leader>mr :call EltonzipGrep(0)<cr>
nnoremap <leader>ms :call EltonzipGrep(1)<cr>

" Cursor
let &t_SI = "\e]12;green\x7"
let &t_EI = "\e]12;cyan\x7"

" Advanced yank
function! EltonzipYank()
	let pos = getpos(".")[2]
	let pos -= 1

	execute "normal! yyp0".pos."l"
endfunction

nnoremap <silent> <C-p> :call EltonzipYank()<cr>
