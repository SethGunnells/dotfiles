local autocompleteLspCapabilities = require'cmp_nvim_lsp'
  .update_capabilities(
    vim.lsp.protocol.make_client_capabilities()
  )

-- Typescript Language Server
require'lspconfig'.tsserver.setup {
  capabilities = autocompleteLspCapabilities,
}

