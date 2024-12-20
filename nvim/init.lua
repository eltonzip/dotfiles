local c = vim.cmd
local o = vim.o
local g = vim.g
local m = vim.keymap.set

--- Basic setup
-- Colorscheme
c.colorscheme('meow')

-- Swap/backup files
o.swapfile = false
o.backup = false

-- Tab
o.smarttab = true
o.expandtab = false
o.tabstop = 4
o.shiftwidth = 4

-- Search stuff
o.ignorecase = true
o.incsearch = true

-- Copy to clipboard
o.mouse = 'a'
o.clipboard = "unnamedplus"

-- netrw
g.netrw_banner = 0

-- StatusLine
o.statusline = '%y %20F %m %6l/%L'

--- C/C++ stuff
-- C syntax
g.c_syntax_for_h = 1

--- Basic Keymaps
g.mapleader = ' '
g.maplocalleader = '\\'

m('n', '-', ':Explore<cr>')
m({'n', 't'}, '<leader>ff', ':FZF -e --walker=file,dir<cr>')

m('n', '<leader>wa', ':wa<cr>')
m('n', '<leader>up', ':up<cr>')

m({'n', 't'}, '<leader>ls', ':ls<cr>:b ')
m({'n', 't'}, '<leader>bp', ':bp<cr>')
m({'n', 't'}, '<leader>bd', ':bd<cr>')
m({'n', 't'}, '<leader>bn', ':bn<cr>')
m({'n', 't'}, '<leader>bl', ':bl<cr>')

m('n', '<leader>tt', ':tabnew .<cr>')

m('n', '<leader>mp', ':set makeprg=')
m('n', '<leader>mm', ':make<cr>')
m('n', '<leader>co', ':copen<cr>')

m('n', '<C-j>', ':cnext<cr>')
m('n', '<C-k>', ':cprevious<cr>')

m('n', '<leader>cx', ':!chmod +x %<cr>')

m('n', '<leader>te', ':b term<cr>')
m('t', '<Esc>', '<C-\\><C-n>')

local M = {}

--- Grep
c.set('grepprg=rg\\ --vimgrep\\ --no-heading\\ --smart-case')

function M.ripgrep()
	local pattern = vim.fn.input('Rg > ')

	if pattern == vim.fn.expand('<Esc>') then return 0 end

	c.grep(pattern)
	c.copen()
end

function M.ripgrep_buffer()
	local pattern = vim.fn.input('Rg (buffer) > ')

	if pattern == vim.fn.expand('<Esc>') then return 0 end

	c.grep(pattern .. ' %')
	c.copen()
end

m('n', '<leader>rp', M.ripgrep)
m('n', '<leader>br', M.ripgrep_buffer)

--- More config
require('eltonzip')
