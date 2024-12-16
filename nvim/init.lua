--- Basic setup
-- Colorscheme
vim.cmd.colorscheme('meow')

-- Swap/backup files
vim.o.swapfile = false
vim.o.backup = false

-- Tab
vim.o.smarttab = true
vim.o.expandtab = false
vim.o.tabstop = 4
vim.o.shiftwidth = 4

-- Search stuff
vim.o.ic = true
vim.o.incsearch = true

-- Copy to clipboard
vim.o.mouse = ''
vim.o.clipboard = "unnamedplus"

-- netrw
vim.g.netrw_banner = 0

-- StatusLine
vim.o.statusline = '%y %20F %m %6l/%L'

--- C/C++ stuff
-- C syntax
vim.g.c_syntax_for_h = 1

--- Basic Keymaps
vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

local map = vim.keymap.set

map('n', '-', ':Explore<cr>')
map({'n', 't'}, '<leader>ff', ':FZF -x --walker=file,dir<cr>')

map('n', '<leader>wa', ':wa<cr>')
map('n', '<leader>up', ':up<cr>')

map({'n', 't'}, '<leader>ls', ':ls<cr>:b ')
map({'n', 't'}, '<leader>bp', ':bp<cr>')
map({'n', 't'}, '<leader>bd', ':bd<cr>')
map({'n', 't'}, '<leader>bn', ':bn<cr>')
map({'n', 't'}, '<leader>bl', ':bl<cr>')

map('n', '<leader>tt', ':tabnew .<cr>')

map('n', '<leader>mp', ':set makeprg=')
map('n', '<leader>mm', ':make<cr>')
map('n', '<leader>co', ':copen<cr>')

map('n', '<C-j>', ':cnext<cr>')
map('n', '<C-k>', ':cprevious<cr>')

map('n', '<leader>cx', ':!chmod +x %<cr>')

map('n', '<leader>te', ':b term<cr>')
map('t', '<Esc>', '<C-\\><C-n>')

local M = {}

--- Grep
local cmd = vim.cmd

cmd.set('grepprg=rg\\ --vimgrep\\ --no-heading\\ --smart-case')

function M.ripgrep()
	local pattern = vim.fn.input('Rg > ')

	if pattern == vim.fn.expand('<Esc>') then return 0 end

	cmd.grep(pattern)
	cmd.copen()
end

function M.ripgrep_buffer()
	local pattern = vim.fn.input('Rg (buffer) > ')

	if pattern == vim.fn.expand('<Esc>') then return 0 end

	cmd.grep(pattern .. ' %')
	cmd.copen()
end

map('n', '<leader>rp', M.ripgrep)
map('n', '<leader>br', M.ripgrep_buffer)

--- More config
require('eltonzip')
