local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

local severityStyleMap = {
  [vim.diagnostic.severity.ERROR] = {signs.Error, 'DiagnosticError'},
  [vim.diagnostic.severity.WARN] = {signs.Warn, 'DiagnosticWarn'},
  [vim.diagnostic.severity.INFO] = {signs.Info, 'DiagnosticInfo'},
  [vim.diagnostic.severity.HINT] = {signs.Hint, 'DiagnosticHint'},
}

vim.diagnostic.config({
  virtual_text = false,
  float = {
    focus=false,
    header='',
    prefix=function(diagnostic)
      local h = severityStyleMap[diagnostic.severity]
      return h[1], h[2]
    end,
  }
})

-- make sure the diagnostic float doesn't auto open instantly
vim.o.updatetime = 250
vim.cmd [[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float({scope="cursor"})]]
vim.keymap.set('n', '<leader>j', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>k', vim.diagnostic.goto_prev)

