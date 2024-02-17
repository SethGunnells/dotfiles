local M = {}

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
M.signs = signs

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

local severityStyleMap = {
  [vim.diagnostic.severity.ERROR] = { signs.Error, 'DiagnosticError' },
  [vim.diagnostic.severity.WARN] = { signs.Warn, 'DiagnosticWarn' },
  [vim.diagnostic.severity.INFO] = { signs.Info, 'DiagnosticInfo' },
  [vim.diagnostic.severity.HINT] = { signs.Hint, 'DiagnosticHint' },
}

vim.diagnostic.config({
  virtual_text = false,
  float = {
    focus = false,
    header = '',
    border = 'rounded',
    prefix = function(diagnostic)
      local h = severityStyleMap[diagnostic.severity]
      return h[1], h[2]
    end,
  }
})

local map = vim.keymap.set
map(
  'n',
  '<leader>h',
  function() vim.diagnostic.open_float({ scope = 'cursor' }) end,
  { desc = 'LSP Hover' }
)
map(
  'n',
  '<leader>j',
  vim.diagnostic.goto_next,
  { desc = 'Go to next diagnostic' }
)
map(
  'n',
  '<leader>k',
  vim.diagnostic.goto_prev,
  { desc = 'Go to previous diagnostic' }
)

return M
