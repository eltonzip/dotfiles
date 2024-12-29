source $HOME/.vimrc

lua << EOF
vim.cmd.set('makeprg=bear\\ --\\ make')

local map = vim.keymap.set

map('n', '<leader>lr', vim.lsp.buf.references)
map('n', '<leader>lc', vim.lsp.buf.rename)

vim.diagnostic.config({
	signs = false
})

vim.api.nvim_create_autocmd('FileType', {
	pattern = {'c', 'cpp'},
	callback = function(ev)
		vim.lsp.start({
			name = 'clangd',
			cmd = {'clangd', '--background-index', '--clang-tidy', '--log=verbose'},
			root_dir = vim.fs.root(0, {'compile_commands.json', 'build.sh', 'Makefile', '.git',}),
		})
	end,
})
EOF
