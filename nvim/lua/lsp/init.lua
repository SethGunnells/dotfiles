local map = vim.keymap.set
map('n', '<leader>h', vim.lsp.buf.hover)
map({ 'n', 'x' }, '<leader>a', vim.lsp.buf.code_action)
map('n', '<leader><leader>r', vim.lsp.buf.rename)

require 'lsp.diagnostics'
require 'lsp.formatting'.setupFormatOnSave()
require 'lsp.tsserver'
require 'lsp.lua'
require 'lsp.null-ls'
require 'lsp.vlang'
require 'lsp.gleam'
require 'lsp.rust'
require 'lsp.julia'
require 'lsp.unison'
