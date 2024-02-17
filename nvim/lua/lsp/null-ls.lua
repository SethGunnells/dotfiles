local nullLs = require 'null-ls'
local utils = require 'null-ls.utils'

nullLs.setup {
  sources = {
    nullLs.builtins.code_actions.eslint_d.with({
      root_dir = utils.root_pattern('.eslintrc.js', '.eslintrc.cjs', '.eslintrc.yaml', '.eslintrc.yml', '.eslintrc.json',
        'package.json')
    }),
    nullLs.builtins.diagnostics.eslint_d.with({
      root_dir = utils.root_pattern('.eslintrc.js', '.eslintrc.cjs', '.eslintrc.yaml', '.eslintrc.yml', '.eslintrc.json',
        'package.json')
    }),
    nullLs.builtins.formatting.prettier,
  },
}
