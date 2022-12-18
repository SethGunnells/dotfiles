require'nvim-tree'.setup({
  hijack_cursor = true,
  actions = {
    open_file = {
      resize_window = true,
    },
  },
})
vim.keymap.set('n', '<leader>t', require'nvim-tree.api'.tree.toggle)

