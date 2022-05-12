local map = vim.api.nvim_set_keymap
map('n', '<leader>h', '<cmd>lua vim.lsp.buf.hover()<cr>', { noremap = true, silent = true })
map('n', '<leader>a', '<cmd>lua vim.lsp.buf.code_action()<cr>', { noremap = true, silent = true })
map('x', '<leader>a', '<cmd>lua vim.lsp.buf.range_code_action()<cr>', { noremap = true, silent = true })

require'lsp.diagnostics'
require'lsp.formatting'.setupFormatOnSave()
require'lsp.tsserver'
require'lsp.lua'
require'lsp.null-ls'

