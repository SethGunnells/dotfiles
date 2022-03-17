require'nvim_comment'.setup({ 
  line_mapping = "<leader>//",
  operator_mapping = "<leader>/",
})
require'nvim-autopairs'.setup()
require'indent_blankline'.setup()
require'twilight'.setup()
require'gitsigns'.setup()
require'trouble'.setup()
require'lsp-colors'.setup()
vim.api.nvim_set_keymap("n", "<leader>x", "<cmd>Trouble<cr>", { silent = true, noremap = true })

