vim.api.nvim_create_autocmd('LspAttach', {
  callback = function()
    local map = vim.keymap.set
    map('n', 'K', vim.lsp.buf.hover, { desc = 'LSP Hover' })
    map({ 'n', 'x' }, '<leader>la', vim.lsp.buf.code_action, { desc = 'LSP Code Action' })
    map('n', '<leader>lr', vim.lsp.buf.rename, { desc = 'LSP Rename Symbol' })

    require('lsp.diagnostics')
    require('lsp.formatting').setupFormatOnSave()
  end,
})

require 'lsp.tsserver'
require 'lsp.null-ls'
require 'lsp.vlang'
require 'lsp.gleam'
require('lsp.lua')
require 'lsp.rust'
require 'lsp.julia'
require 'lsp.unison'
