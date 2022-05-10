local nullLs = require'null-ls'

nullLs.setup {
  sources = {
    nullLs.builtins.code_actions.eslint_d,
    nullLs.builtins.diagnostics.eslint_d,
    nullLs.builtins.formatting.prettier,
  },
}
