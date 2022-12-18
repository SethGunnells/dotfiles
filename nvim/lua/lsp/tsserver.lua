local autocompleteLspCapabilities = require'cmp_nvim_lsp'.default_capabilities()

-- Typescript Language Server
require'lspconfig'.tsserver.setup {
  capabilities = autocompleteLspCapabilities,
}

