local M = {}

local map = vim.keymap.set
local cmd = vim.cmd
local create_command = vim.api.nvim_create_user_command

create_command('EltonzipTest', 'echo "meow!"', {})

-- TODOs
function M.find_todos()
	cmd.grep('-s TODO')
	cmd.copen()
end

create_command('EltonzipFindTodos', function(opts)
		M.find_todos()
	end,
	{nargs = 0})

map('n', '<leader>eft', M.find_todos)

-- Find references
function M.find_refs()
	cmd.grep('-s ' .. vim.fn.expand('<cword>'))
	cmd.copen()
end

create_command('EltonzipFindRefs', function(opts)
		M.find_refs()
	end,
	{nargs = 0})

map('n', '<leader>er', ':EltonzipFindRefs<cr>')

-- Find references (src/)
function M.find_refs_src()
	cmd.grep('-s ' .. vim.fn.expand('<cword>') .. ' src')
	cmd.copen()
end

create_command('EltonzipFindRefsSrc', function(opts)
		M.find_refs_src()
	end,
	{nargs = 0})

map('n', '<leader>es', ':EltonzipFindRefsSrc<cr>')

-- Find references (WORD)
function M.find_refs_word()
	cmd.grep('-s -e ' .. vim.fn.expand('<cWORD>'))
	cmd.copen()
end

create_command('EltonzipFindRefsWord', function(opts)
		M.find_refs_word()
	end,
	{nargs = 0})

map('n', '<leader>ew', ':EltonzipFindRefsWord<cr>')

-- Find references (buffer)
function M.find_refs_buff()
	cmd.grep('-s ' .. vim.fn.expand('<cword>') .. ' %')
	cmd.copen()
end

create_command('EltonzipFindRefsBuff', function(opts)
		M.find_refs_buff()
	end,
	{nargs = 0})

map('n', '<leader>eb', ':EltonzipFindRefsBuff<cr>')

-- Quicklist rename
function M.quicklist_rename(old_name, new_name)
	cmd.cdo('s/\\C' .. old_name .. '/' .. new_name .. '/g | update')
end

create_command('EltonzipQuicklistRename', function(opts)
		local from = vim.fn.input('Rename pattern > ')
		if from == vim.fn.expand('<Esc>') or from == vim.fn.expand('<Enter>') then return 0 end

		local to = vim.fn.input('To > ')
		if to == vim.fn.expand('<Esc>') or to == vim.fn.expand('<Enter>') then return 0 end

		M.quicklist_rename(from, to)
	end,
	{nargs = '*'})

map('n', '<leader>ec', ':EltonzipQuicklistRename<cr>')

--- LSP config
vim.diagnostic.config({
	signs = false,
})

map('n', '<leader>lr', vim.lsp.buf.references)
map('n', '<leader>lc', vim.lsp.buf.rename)

--- Clangd
function M.start_clangd()
	vim.api.nvim_create_autocmd('FileType', {
	pattern = {'c', 'cpp'},
	callback = function(ev)
		vim.lsp.start({
			name = 'clangd',
			cmd = {'clangd', '--background-index', '--clang-tidy', '--log=verbose'},
			root_dir = vim.fs.root(0, { 'compile_commands.json', 'Makefile', '.git', 'build.sh'})
		})
	end,
	})
end

create_command('EltonzipStartClangd', function(opts)
	M.start_clangd()
	end,
	{nargs = 0})

map('n', '<leader>elsc', ':EltonzipStartClangd<cr>')
