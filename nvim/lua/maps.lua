local m = vim.keymap.set

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
