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

--- Advanced setup
vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

local M = {}

-- Grep
c.set('grepprg=rg\\ --vimgrep\\ --no-heading\\ --smart-case')

function M.ripgrep()
	local pattern = vim.fn.input('rg > ')

	if pattern == vim.fn.expand('<Esc>') then return 0 end

	c.grep(pattern)
	c.copen()
end

function M.ripgrep_buffer()
	local pattern = vim.fn.input('rg (buffer) > ')

	if pattern == vim.fn.expand('<Esc>') then return 0 end

	c.grep(pattern .. ' %')
	c.copen()
end

m('n', '<leader>rp', M.ripgrep)
m('n', '<leader>br', M.ripgrep_buffer)

--- More config
require('maps')
require('eltonzip')
