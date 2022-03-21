-- go here for more LSPs: https://github.com/neovim/nvim-lspconfig

local lspconfig = require'lspconfig'
local util = lspconfig.util
local map = vim.api.nvim_set_keymap

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
    scope='cursor',
    prefix=function(diagnostic)
      local h = severityStyleMap[diagnostic.severity]
      return h[1], h[2]
    end,
  }
})
vim.o.updatetime = 250
vim.cmd [[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float()]]

map('n', '<leader>h', '<cmd>lua vim.lsp.buf.hover()<cr>', { noremap = true, silent = true })

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Typescript Language Server
lspconfig.tsserver.setup{
  on_attach = function(client)
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false
  end,
  capabilities = capabilities,
}

lspconfig.sumneko_lua.setup{}

-- ESLint and Prettier
lspconfig.diagnosticls.setup{
  filetypes = {"javascript", "json", "typescript", "typescriptreact"},
  root_dir = function(fname)
    return util.root_pattern("tsconfig.json")(fname)
      or util.root_pattern(".eslintrc.js")(fname)
      or util.root_pattern("package.json")(fname);
  end,
  init_options = {
    linters = {
      eslint = {
        command = "eslint_d",
        rootPatterns = {".eslintrc.js", ".git"},
        debounce = 100,
        args = {
          "--stdin",
          "--stdin-filename",
          "%filepath",
          "--format",
          "json"
        },
        sourceName = "eslint",
        parseJson = {
          errorsRoot = "[0].messages",
          line = "line",
          column = "column",
          endLine = "endLine",
          endColumn = "endColumn",
          message = "[eslint] ${message} [${ruleId}]",
          security = "severity"
        },
        securities = {
          [2] = "error",
          [1] = "warning"
        }
      },
    },
    formatters = {
      prettier = {
        command = "prettier",
        args = {
          "--stdin",
          "--stdin-filepath",
          "%filepath"
        }
      }
    },
    filetypes = {
      javascript = "eslint",
      typescript = "eslint",
      typescriptreact = "eslint"
    },
    formatFiletypes = {
      javascript = 'prettier',
      json = 'prettier',
      typescript = 'prettier',
      typescriptreact = 'prettier'
    }
  }
}

-- Add FormatEnable and FormatDisable commands
local cmd = vim.api.nvim_command
cmd([[command FormatEnable augroup sethfmt | exe "autocmd BufWrite * lua vim.lsp.buf.formatting_sync(nil, 1000)" | augroup END]])
cmd([[command FormatDisable autocmd! sethfmt BufWrite *]])
cmd([[FormatEnable]])

