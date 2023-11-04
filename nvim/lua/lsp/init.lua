local map = vim.keymap.set
map('n', '<leader>h', vim.lsp.buf.hover)

require'lsp.diagnostics'
require'lsp.formatting'.setupFormatOnSave()
require'lsp.tsserver'
require'lsp.lua'
require'lsp.null-ls'
map({ 'n', 'x' }, '<leader>a', vim.lsp.buf.code_action)
map('n', '<leader><leader>r', vim.lsp.buf.rename)

