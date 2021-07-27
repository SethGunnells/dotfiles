-- go here for more LSPs: https://github.com/neovim/nvim-lspconfig

local lspconfig = require'lspconfig'
local util = lspconfig.util
local map = vim.api.nvim_set_keymap

map('n', '<leader><leader>h', '<cmd>lua vim.lsp.buf.hover()<CR>', { noremap = true, silent = true })

-- Typescript Language Server
lspconfig.tsserver.setup{
  on_attach = function(client)
    client.resolved_capabilities.document_formatting = false
  end;
}

-- ESLint and Prettier
lspconfig.diagnosticls.setup{
  filetypes = {"javascript", "typescript"},
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
      typescript = "eslint"
    },
    formatFiletypes = {
      javascript = 'prettier'
    }
  }
}

local sign = vim.fn.sign_define
sign('LspDiagnosticsSignError', { text = '' })
sign('LspDiagnosticsSignWarning', { text = '' })
sign('LspDiagnosticsSignInformation', { text = '' })
sign('LspDiagnosticsSignHint', { text = '' })

-- Add FormatEnable and FormatDisable commands
local cmd = vim.api.nvim_command
cmd([[command FormatEnable augroup sethfmt | exe "autocmd BufWrite * lua vim.lsp.buf.formatting_sync(nil, 1000)" | augroup END]])
cmd([[command FormatDisable autocmd! sethfmt BufWrite *]])
cmd([[FormatEnable]])

