local map = vim.keymap.set
map('n', '<leader>h', vim.lsp.buf.hover)
map({'n', 'x'}, '<leader>a', vim.lsp.buf.code_action)

require'lsp.diagnostics'
require'lsp.formatting'.setupFormatOnSave()
require'lsp.tsserver'
require'lsp.lua'
require'lsp.null-ls'

