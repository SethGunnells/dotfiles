-- remap vim-surround key bindings

vim.g.surround_no_mappings = 1

local map = vim.keymap.set

map('n', '<leader>s', '<plug>Ysurround')
map('x', '<leader>s', '<plug>VSurround')
map('n', '<leader>S', '<plug>YSurround')
map('n', '<leader>ss', '<plug>Yssurround')
map('n', '<leader>Ss', '<plug>YSsurround')
map('n', '<leader>SS', '<plug>YSsurround')

map('n', '<leader>c', '<plug>Csurround')
map('n', '<leader>C', '<plug>CSurround')

map('n', '<leader>D', '<plug>Dsurround')
