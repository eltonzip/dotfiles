local M = {}

local m = vim.keymap.set
local c = vim.cmd
local cc = vim.api.nvim_create_user_command

cc('EltonzipTest', 'echo "meow!"', {})

-- TODOs
function M.find_todos()
	c.grep('-s TODO')
	c.copen()
end

cc('EltonzipFindTodos', function(opts)
		M.find_todos()
	end,
	{nargs = 0})

m('n', '<leader>eft', M.find_todos)

-- Find references
function M.find_refs()
	c.grep('-s ' .. vim.fn.expand('<cword>'))
	c.copen()
end

cc('EltonzipFindRefs', function(opts)
		M.find_refs()
	end,
	{nargs = 0})

m('n', '<leader>er', ':EltonzipFindRefs<cr>')

-- Find references (src/)
function M.find_refs_src()
	c.grep('-s ' .. vim.fn.expand('<cword>') .. ' src')
	c.copen()
end

cc('EltonzipFindRefsSrc', function(opts)
		M.find_refs_src()
	end,
	{nargs = 0})

m('n', '<leader>es', ':EltonzipFindRefsSrc<cr>')

-- Find references (WORD)
function M.find_refs_word()
	c.grep('-s -e ' .. vim.fn.expand('<cWORD>'))
	c.copen()
end

cc('EltonzipFindRefsWord', function(opts)
		M.find_refs_word()
	end,
	{nargs = 0})

m('n', '<leader>ew', ':EltonzipFindRefsWord<cr>')

-- Find references (buffer)
function M.find_refs_buff()
	c.grep('-s ' .. vim.fn.expand('<cword>') .. ' %')
	c.copen()
end

cc('EltonzipFindRefsBuff', function(opts)
		M.find_refs_buff()
	end,
	{nargs = 0})

m('n', '<leader>eb', ':EltonzipFindRefsBuff<cr>')

-- Quicklist rename
function M.quicklist_rename(old_name, new_name)
	c.cdo('s/\\C' .. old_name .. '/' .. new_name .. '/g | update')
end

cc('EltonzipQuicklistRename', function(opts)
		local from = vim.fn.input('Rename pattern > ')
		if from == vim.fn.expand('<Esc>') or from == vim.fn.expand('<Enter>') then return 0 end

		local to = vim.fn.input('To > ')
		if to == vim.fn.expand('<Esc>') or to == vim.fn.expand('<Enter>') then return 0 end

		M.quicklist_rename(from, to)
	end,
	{nargs = '*'})

m('n', '<leader>ec', ':EltonzipQuicklistRename<cr>')

--- LSP config
vim.diagnostic.config({
	signs = false,
})

m('n', '<leader>lr', vim.lsp.buf.references)
m('n', '<leader>lc', vim.lsp.buf.rename)

--- Clangd
function M.start_clangd()
	vim.api.nvim_create_autoc('FileType', {
	pattern = {'c', 'cpp'},
	callback = function(ev)
		vim.lsp.start({
			name = 'clangd',
			c = {'clangd', '--background-index', '--clang-tidy', '--log=verbose'},
			root_dir = vim.fs.root(0, { 'compile_commands.json', 'Makefile', '.git', 'build.sh'})
		})
	end,
	})
end

cc('EltonzipStartClangd', function(opts)
	M.start_clangd()
	end,
	{nargs = 0})

m('n', '<leader>elsc', ':EltonzipStartClangd<cr>')
