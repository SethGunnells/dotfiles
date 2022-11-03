require'nvim-tree'.setup({
  hijack_cursor = true,
  actions = {
    open_file = {
      resize_window = true,
    },
  },
  view = {
    width = 50,
  },
})
vim.api.nvim_set_keymap('n', '<leader>t', '<cmd>NvimTreeToggle<CR>', { noremap = true })

