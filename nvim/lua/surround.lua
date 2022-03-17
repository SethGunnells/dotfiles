-- remap vim-surround key bindings

vim.g.surround_no_mappings = 1

local map = vim.api.nvim_set_keymap
local unmap = vim.api.nvim_del_keymap

map('n', '<leader>s', '<plug>Ysurround', {})
map('x', '<leader>s', '<plug>VSurround', {})
map('n', '<leader>S', '<plug>YSurround', {})
map('n', '<leader>ss', '<plug>Yssurround', {})
map('n', '<leader>Ss', '<plug>YSsurround', {})
map('n', '<leader>SS', '<plug>YSsurround', {})

map('n', '<leader>c', '<plug>Csurround', {})
map('n', '<leader>C', '<plug>CSurround', {})

map('n', '<leader>D', '<plug>Dsurround', {})
