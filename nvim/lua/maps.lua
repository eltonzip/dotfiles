--- Basic Keymaps
local m = vim.keymap.set

m('n', '-', ':Explore<cr>')
m('n', '<leader>ff', ':FZF -e --walker=file,dir<cr>')
m('n', '<leader>ls', ':ls<cr>:b ')
m('n', '<leader>tt', ':tabnew .<cr>')
m('n', '<leader>mp', ':set makeprg=')
m('n', '<C-j>', ':cnext<cr>')
m('n', '<C-k>', ':cprevious<cr>')
m('n', '<leader>cx', ':!chmod +x %<cr>')
