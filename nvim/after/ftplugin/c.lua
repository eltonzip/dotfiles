local iabbrev = vim.cmd.iabbrev

iabbrev('Cmain int main(int argc, char *argv[])<cr>{<cr>}<esc>k')
iabbrev('Cswitch switch () {<cr>}<esc>kf)h')
iabbrev('Cif if () {<cr>}<esc>kf)h')
iabbrev('Celse else {<cr>}<esc>k$')
iabbrev('Celseif else if () {<cr>}<esc>kf)h')
iabbrev('Cwhile while () {<cr>}<esc>kf)h')
iabbrev('Cdwhile do {<cr>} while ()<esc>h')
iabbrev('Cfor for () {<cr>}<esc>kf)h')

vim.treesitter.start()
