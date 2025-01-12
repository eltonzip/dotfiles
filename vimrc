" Options
set nocompatible
set noshowmode

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
colorscheme evening

" Keymaps
let mapleader = " "
let maplocalleader = "\\"

nnoremap - :Explore<cr>

if executable('fzf')
	nnoremap <leader>ff :FZF -e --walker=file,dir<cr>
else
	set path+=**
	nnoremap <leader>ff :find ./
endif

function! EltonzipFind(num)
	if !a:num
		nnoremap <leader>ff :FZF -e --walker=file,dir<cr>
	elseif a:num
		set path+=**
		nnoremap <leader>ff :find ./
	endif
endfunction

nnoremap <silent> <leader>mz :call EltonzipFind(0)<cr>
nnoremap <silent> <leader>mf :call EltonzipFind(1)<cr>

nnoremap <leader>ls :ls<cr>:b 

nnoremap <silent> <C-j> :cnext<cr>
nnoremap <silent> <C-k> :cprevious<cr>

nnoremap <silent> <C-l> :nohl<cr><C-l>

nnoremap <C-p> O<Esc>

nnoremap <leader>mp :set makeprg=
nnoremap <leader>mm :execute "make \| copen"<cr>

nnoremap <silent> <leader>ke :set keymap=""<cr>
nnoremap <silent> <leader>kr :set keymap=russian-jcukenwin<cr>

nnoremap <leader>cx :!chmod +x %<cr>

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
	iabbrev Pmain if __name__ == "__main__":
endfunction

augroup python
	autocmd!
	autocmd FileType python call EltonzipPythonAbbr()
augroup END

" Bash stuff
function! EltonzipBashAbbr()
	iabbrev Bif if [  ]; then<cr>fi<Esc>kf[l
	iabbrev Belif elif [  ]; then<Esc>F]hh
	iabbrev Bfunction function  {<cr>}<Esc>kt{h
endfunction

augroup shell
	autocmd!
	autocmd FileType sh call EltonzipBashAbbr()
augroup END

" netrw
let g:netrw_banner = 0

" Grep
if executable('rg')
	set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case\ --iglob=!tags
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
	elseif a:num == 1
		grep <cword> src/
	else
		grep <cword> %
	endif

	copen
endfunction

nnoremap <leader>rp :call EltonzipGrepPrompt()<cr>
nnoremap <leader>mr :call EltonzipGrep(0)<cr>
nnoremap <leader>ms :call EltonzipGrep(1)<cr>
nnoremap <leader>mb :call EltonzipGrep(2)<cr>
