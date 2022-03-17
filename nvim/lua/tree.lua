require'nvim-tree'.setup({
  actions = {
    open_file = {
      resize_window = true,
    },
  },
})
vim.api.nvim_set_keymap('n', '<leader>t', '<cmd>NvimTreeToggle<CR>', { noremap = true })

