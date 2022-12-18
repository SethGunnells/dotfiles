require'nvim_comment'.setup({
  line_mapping = "<leader>//",
  operator_mapping = "<leader>/",
})
require'nvim-autopairs'.setup()
require'indent_blankline'.setup()
require'twilight'.setup()
require'trouble'.setup()
require'lsp-colors'.setup()

local map = vim.keymap.set

map("n", "<leader>x", "<cmd>Trouble<cr>", { silent = true })

local gs = require'gitsigns'
gs.setup()
map('n', '<leader><leader>j', gs.next_hunk)
map('n', '<leader><leader>k', gs.prev_hunk)

