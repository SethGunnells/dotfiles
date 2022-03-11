require'nvim-tree'.setup({ view = { width = '20%' } })
vim.api.nvim_set_keymap('n', '<leader>t', '<cmd>NvimTreeToggle<CR>', { noremap = true })

